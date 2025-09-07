{ config, pkgs, ... }:
{
#Ly
services.displayManager = {
		ly.enable = true;
		ly.settings = {animation = "matrix";};
	};
}