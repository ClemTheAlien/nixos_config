	{ config, pkgs, ... }: {
#Steam 
  programs.steam= {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  hardware.steam-hardware.enable = true;
  }