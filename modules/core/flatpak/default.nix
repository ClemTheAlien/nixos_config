	{ config, pkgs, ... }:{
  #Flatpak
	services.flatpak = {
		enable = true;
	};
		xdg.portal = {
			enable = true;
			xdgOpenUsePortal = false; 			
			extraPortals = with pkgs;[
				xdg-desktop-portal-gtk
		];
	};

  }