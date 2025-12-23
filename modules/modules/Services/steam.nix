	{ config, pkgs, ... }: {
#Steam 
  programs.steam= {
    enable = true;
  };
  hardware.steam-hardware.enable = true;
  }