{ config, pkgs, ... }:
{
  # Virt Manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
