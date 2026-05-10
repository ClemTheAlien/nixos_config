		{ config, pkgs, ... }: {
  # Virt Manager (QEMU/KVM Virt Machines) 
	programs.virt-manager.enable = true;
	users.groups.libvirtd.members = ["clemmie"];
	virtualisation.libvirtd.enable = true;
	#Docker
	virtualisation.docker.enable = true;
    }