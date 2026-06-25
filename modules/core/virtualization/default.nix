		{ config, pkgs, ... }: {

  # Virt Manager (QEMU/KVM Virt Machines) 
	programs.virt-manager.enable = true;
	users.groups.libvirtd.members = ["clemmie"];
	virtualisation.libvirtd.enable = true;
	#Docker
	virtualisation.docker.enable = true;
	#Podman
	virtualisation.containers.enable = true;
	virtualisation.podman = {
  enable = true;
};
	#Distrobox
	environment.systemPackages = [
  pkgs.distrobox
	pkgs.wl-clipboard
];
	environment.etc."distrobox/distrobox.conf".text = ''
  container_additional_volumes="/nix/store:/nix/store:ro"
'';

	#Waydroid
  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables;

    }