{ lib, pkgs, ... }:
{
  home = {	
    packages = with pkgs; [

    ];
    programs.git = {
    enable = true;
    userName  = "ClemTheAlien";
    userEmail = "ClemTheAlien@proton.me";
    };


    username = "clemmie";
    homeDirectory = "/home/clemmie";

    stateVersion = "24.11";
  };
}
