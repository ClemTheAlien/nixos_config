	{ config, pkgs, ... }:{
  #Flatpak
	services.flatpak = {
		enable = true;
		packages = [
			"com.github.tchx84.Flatseal"
			"app.ytmdesktop.ytmdesktop"
			"org.prismlauncher.PrismLauncher"
			"org.vinegarhq.Sober"
			"org.openshot.OpenShot"
			"im.dino.Dino"
		];
	}
		xdg.portal = {
			enable = true;
			xdgOpenUsePortal = true; 			
			extraPortals = with pkgs;[
				xdg-desktop-portal-gtk
		];
	};

  }