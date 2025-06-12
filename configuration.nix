# ClemTheAlien's NixOS

{ config, pkgs, lib, ... }:

{
	imports =
	[ # Include the results of the hardware scan.
		./hardware-configuration.nix
	];
	#Kernel
	boot.kernelPackages = pkgs.linuxPackages_zen;
	#Nvidia Support
	hardware.graphics.enable = true;
	services.xserver.videoDrivers = ["noveau"];
	hardware.nvidia.open = true;
	hardware.nvidia. nvidiaSettings = true;
 	# Bootloader.
	boot.loader.systemd-boot.enable =true;
	boot.loader.limine.style.wallpapers = [/home/clemmie/.extraConfig];
	# Hostname
	networking.hostName = "[CHANGE ME]";
	# Enable networking
	networking.networkmanager.enable = true;
  	#Timezone
	time.timeZone = "[CHANGE ME]]";
	#Printing Daemon
	services.printing.enable = true;
	services.avahi = {
	  enable = true;
	  nssmdns4 = true;
	  openFirewall = true;
	};
	# Virt Manager (Only Qemu/KVM hypervisor) 
	programs.virt-manager.enable = true;
	users.groups.libvirtd.members = ["clemmie"];
	virtualisation.libvirtd.enable = true;

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
	#Default Shell (ZSH)
	programs.zsh.enable = true; # Use script with dotfiles to install zsh plugins
	programs.zsh.autosuggestions.enable = true;
  	programs.zsh.syntaxHighlighting.enable = true;

	# Define a user account.
	users.users.clemmie = { #CHANGE ME and all instances of Clemmie
		isNormalUser = true;
		description = "main user";
		extraGroups = [ "networkmanager" "wheel" ];
		packages = with pkgs; [];
		shell = pkgs.zsh;
	};
	#Allow Non-Foss
	nixpkgs.config.allowUnfree = true;	
	    #SearXNG Search Engine
	services.searx = {
		enable = true;
		settings = {
			server = {
        port = 8888;
        bind_address = "127.0.0.1";
        secret_key = "[INSERT A KEY OR WHATEVER]";
			};
        };
    };
	#AI in Web Browser 
	services.ollama = {
		enable = true;
		acceleration = "cuda";
	};
	services.open-webui = {
		enable = true;
		port = 08080;
	};

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
		swaylock-effects #lockscreen
		rofi-wayland # rofi 
		wl-clipboard #clipboard
		waypaper #wallpapers
		waybar #customizable bar

		flameshot #screenshot
		webcamoid #webcam 
		alacritty #terminal
		fastfetch #fetch
		pywal16 # colorscheme
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
		vscodium #IDE 
		eclipses.eclipse-java #Java IDE 
		cudatoolkit #CUDA Support
			# CyberSec Tools
		wireshark # packet sniffing
		mullvad-vpn #VPN
		
			#Electrical Engineering Tools
		kicad #pcb maker
		logisim-evolution #pcb maker

			# Art Tools
		krita #picture manipulation tool
		obs-studio #video recording software
		handbrake #video compressor
		curtail #image compressor
		metadata-cleaner #cleans metadata
		
	];
	# Sys Ver
	system.stateVersion = "25.05";
	
	#SwayWM
	programs.sway = {
 		enable = true;
 		wrapperFeatures.gtk = true;
  	};	
	services.displayManager = {
		ly.enable = true;
		ly.settings = {animation = "matrix";};
	};

	# File System Auto USB Mount
	services.gvfs.enable = true;
	services.udisks2.enable = true;
	services.devmon.enable = true;

	
	#Fonts
	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-emoji
		fira-code
		fira-code-symbols
	];

	#Flatpak
	services.flatpak.enable = true;
		xdg.portal = {
			enable = true;
			xdgOpenUsePortal = true; 			
			extraPortals = with pkgs;[
				xdg-desktop-portal-gtk
		];
	};
	#Audio (Pipewire)
	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};

	#Bluetooth 
	services.blueman.enable = true;
	hardware.bluetooth.enable = true; 
	hardware.bluetooth.powerOnBoot = true;
}
