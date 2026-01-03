{ pkgs, ... }:
{
home.packages = with pkgs; [
    nitrogen
  ];
home.file.".config/awesome" = {
    source = ./Configs/rc.lua; # Point to your local folder
    recursive = true; # Symlinks the whole directory
  };
}