{inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    
    ../../modules/core
    ../../modules/desktop
    ../../modules/apps
    ../../modules/core/virtualization
  ];
  networking.hostName = "themojave";
}