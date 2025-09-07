	{ config, pkgs, ... }:
	{
	#Nvidia Support
	hardware.graphics.enable = true;
	services.xserver.videoDrivers = ["noveau"];
	hardware.nvidia.open = true;
	hardware.nvidia. nvidiaSettings = true;
	}