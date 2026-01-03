		{ config, pkgs, ... }: {
  # Virt Manager (QEMU/KVM Virt Machines) 
	programs.virt-manager.enable = true;
	users.groups.libvirtd.members = ["clemmie"];
	virtualisation.libvirtd.enable = true;
	#Virtual Box
	virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "clemmie" ];
	#Docker
	virtualisation.docker.enable = true;
    }