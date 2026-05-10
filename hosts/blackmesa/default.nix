{inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    
    ../../modules/core
    ../../modules/desktop
    ../../modules/apps
    ../../modules/core/nvidia
    ../../modules/apps/steam
  ];
  networking.hostName = "blackmesa";
}