	#Flatpak
	services.flatpak.enable = true;
		xdg.portal = {
			enable = true;
			xdgOpenUsePortal = true; 			
			extraPortals = with pkgs;[
				xdg-desktop-portal-gtk
		];
	};