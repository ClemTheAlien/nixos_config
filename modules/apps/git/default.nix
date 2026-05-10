{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
    user.name = "ClemTheAlien";
    user.email = "ClemTheAlien@proton.me";
    };
  };
}