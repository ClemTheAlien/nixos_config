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
];

# Ensure Distrobox can resolve symlinks pointing back to the Nix store
environment.etc."distrobox/distrobox.conf".text = ''
  container_additional_volumes="/nix/store:/nix/store:ro"
'';
    }