{ config, pkgs, ... }: {

  # 1. Allow unfree software (Required for proprietary drivers)
  nixpkgs.config.allowUnfree = true;

  # 2. Basic Graphics Support
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Required for Steam/Wine
  };

  # 3. NVIDIA Proprietary Configuration
  services.xserver.videoDrivers = [ "nvidia" ]; # Removed "noveau"

  hardware.nvidia = {
    # Modesetting is required for most modern Wayland/X11 compositors
    modesetting.enable = true;

    # Use the proprietary drivers (set to false)
    # Note: "open = true" is for newer Turing/Ampere cards but proprietary is still more stable for laptops
    open = false; 

    # Enable the Nvidia settings menu
    nvidiaSettings = true;

    # Setup NVIDIA Optimus PRIME for your Legion Laptop
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # Bus IDs for Lenovo Legion S7 16IAH7 (82TF)
      # These are standard for this model, but check 'lspci' if it fails to boot
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
