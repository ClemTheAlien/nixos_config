{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
	
    ];

    username = "clemmie";
    homeDirectory = "/home/clemmie";

    stateVersion = "24.11";
  };
}
