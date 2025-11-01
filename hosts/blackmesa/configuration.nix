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
		./modules/System/Kernel/kernel.nix
		./modules/System/Graphics/nvidia.nix
		./modules/System/Daemons/printing.nix
		./modules/Services/virtualization.nix
		./modules/System/Shells/zsh.nix
		./modules/System/Greeters/ly.nix
		./modules/System/Etc/fonts.nix
		./modules/System/Daemons/xdg.nix
		./modules/System/Daemons/bluetooth.nix
		./modules/System/Daemons/pipewire.nix
		./modules/Pkgs/flatpak.nix
		./modules/Services/searxng.nix
		./modules/Services/steam.nix
		./modules/System/Bootloaders/systemdboot.nix
	];
	# Hostname
	networking.hostName = "blackmesa";
	# Enable networking
	networking.networkmanager.enable = true;
  	#Timezone
	time.timeZone = "America/Chicago";

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
	#Flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
	# Packages
	environment.systemPackages = with pkgs; [
		# System Tools
		home-manager
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
		
	];
	# Sys Ver
	system.stateVersion = "25.05";

	# File System Auto USB Mount
	services.gvfs.enable = true;
	services.udisks2.enable = true;
	services.devmon.enable = true;

	# MangoWc
	programs.mango.enable = true;
}

