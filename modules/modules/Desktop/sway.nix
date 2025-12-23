	{ config, pkgs, ... }:{
#Sway
	programs.sway = {
    	enable = true;
			wrapperFeatures.gtk = true;
	};
  }