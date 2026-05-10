{ config, pkgs, ... }:

#FIX THIS FOR THE SPECIFIC MEDIA U USE AND ONLY USE GRUB FOR BIOS
{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
}
