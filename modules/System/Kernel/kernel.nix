{ config, pkgs, ... }: {
#Kernel
boot.kernelPackages = pkgs.linuxPackages_zen;
boot.kernelParams = [ "quiet" "splash" ];
boot.plymouth.enable = true;
}