{ config, pkgs, ... }: {
#Kernel
boot.kernelPackages = pkgs.linuxPackages_zen;
}