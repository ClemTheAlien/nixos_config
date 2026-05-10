{inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    
    ../../modules/core
    ../../modules/desktop
    ../../modules/apps
  ];
  networking.hostName = "themojave";
}