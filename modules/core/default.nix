{ config, pkgs, inputs, ... }:
{
  imports = [
    ./kernel
    ./udiskie
    ./systemd-boot
    ./network-manager
    ./power-profile
    ./bluetooth
    ./pipewire
    ./xdg
    ./fonts
    ./ly
    ./flatpak
    ./zsh
  ];


  time.timeZone = "America/Chicago";
  nixpkgs.config.allowUnfree = true;	
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";

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

users.users.clemmie = { #CHANGE ME and all instances of Clemmie
	isNormalUser = true;
	description = "main user";
	extraGroups = [ "networkmanager" "wheel" "docker"];
	packages = with pkgs; [];
	shell = pkgs.zsh;
  };

nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
nix.registry.nixpkgs.flake = inputs.nixpkgs;

}
