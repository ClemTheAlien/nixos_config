# ClemTheAlien's NixOS

{ config, pkgs, lib, ... }:

{
nixpkgs.overlays = [
(final: prev: {
  flameshot = prev.flameshot.overrideAttrs (previousAttrs: {
    cmakeFlags = [
      "-DUSE_WAYLAND_CLIPBOARD=1"
      "-DUSE_WAYLAND_GRIM=1"
    ];
    buildInputs = previousAttrs.buildInputs ++ [ final.libsForQt5.kguiaddons ];
  });
})

];
	imports =
	[ # Include the results of the hardware scan.
		./hardware-configuration.nix
		./modules/kernel.nix
		./modules/nvidia.nix
		./modules/printing.nix
		./modules/virtualization.nix
		./modules/zsh.nix
		./modules/sway.nix
		./modules/ly.nix
		./modules/fonts.nix
		./modules/xdg.nix
		./modules/bluetooth.nix
		./moudles/pipewire.nix
		./modules/flatpak.nix
	];
	# Hostname
	networking.hostName = "[Change ME]";
	# Enable networking
	networking.networkmanager.enable = true;
  	#Timezone
	time.timeZone = "[CHANGE ME]";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	# Define a user account.
	users.users.clemmie = { #CHANGE ME and all instances of Clemmie
		isNormalUser = true;
		description = "main user";
		extraGroups = [ "networkmanager" "wheel" "docker"];
		packages = with pkgs; [];
		shell = pkgs.zsh;
	};
	#Allow Non-Foss
	nixpkgs.config.allowUnfree = true;	

	# Packages
	environment.systemPackages = with pkgs; [
		# System Tools
		bluez #bluetooth
		bluez-tools #bluetooth
		blueman #bluetooth gui
		networkmanagerapplet #wifi controller
		pavucontrol #audio
		swaybg #backgrounds
		mako #notifications
		pcmanfm #file explorer
		feh #image viewer
		swayfx #sway effects
		rofi-wayland # rofi 
		wl-clipboard #clipboard
		waypaper #wallpapers
		waybar #customizable bar

		flameshot #screenshot
		webcamoid #webcam 
		alacritty #terminal
		fastfetch #fetch
		pywal # colorscheme
		imagemagick #colorscheme backend
		cava #audio visualizer

		# Apps
		  #Productivity & Browsers
    mmex #money manager 
		librewolf #browser (use SearXNG as search engine)
		keepassxc # password manager
		logseq #note taking

			# Chat Apps, Games & Media
		vesktop #discord
		weechat #irc
		lutris #game manager
		vlc #video
		libreoffice #document suite editor
			
			#Coding Tools
		git # ver control
		gitflow #git flow (enhanced ver control)
		gh #github
		act #github actions
		vscodium #IDE 
		eclipses.eclipse-java #Java IDE 
		cudatoolkit #CUDA Support
			# CyberSec Tools
		wireshark # packet sniffing
		mullvad-vpn #VPN
		
			#Electrical Engineering Tools
		kicad #pcb maker
		logisim-evolution #pcb maker
		ghidra-bin #reverse engineering

			# Art Tools
		krita #picture manipulation tool
		obs-studio #video recording software
		handbrake #video compressor
		curtail #image compressor
		metadata-cleaner #cleans metadata
		
	];
	# Sys Ver
	system.stateVersion = "25.05";

	# File System Auto USB Mount
	services.gvfs.enable = true;
	services.udisks2.enable = true;
	services.devmon.enable = true;

}
