{ config, pkgs, lib, ... }:

{
  # 1. Enable NVIDIA Drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false; # Set to true if you want better battery life, but can be buggy
    open = false; # Set to true only if you have a Turing (RTX 20-series) or newer card
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # PRIME Configuration (Crucial for Laptops)
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      
      # !!! REPLACE THESE with the IDs from the lspci command !!!
      # Example: "00:02.0" becomes "PCI:0:2:0"
      intelBusId = "PCI:0:2:0"; 
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # 2. Graphics Support
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # 3. Jellyfin Service
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  # Ensure the jellyfin user is in the video and render groups
  users.users.jellyfin.extraGroups = [ "video" "render" ];

  # 4. Optional: Allow unfree for NVIDIA drivers
  nixpkgs.config.allowUnfree = true;
}