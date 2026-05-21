{ config, pkgs, ... }:
{
  # Packages
	environment.systemPackages = with pkgs; [
		# System Tools
		home-manager
		bluez #bluetooth
		bluez-tools #bluetooth
		blueman #bluetooth gui
		pwvucontrol #audio gui
		networkmanagerapplet #network gui
		pcmanfm #file explorer
		feh #image viewer
		wl-clipboard #clipboard

		webcamoid #webcam 
		alacritty #terminal
		fastfetch #fetch
		pywal # colorscheme
		imagemagick #colorscheme backend
		cava #audio visualizer
		grim#screenshot
		satty#screenshot
		slurp #screenshot
	];
}