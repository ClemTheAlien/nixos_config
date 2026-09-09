# Installation Guide
## Installation from Minimal ISO
> https://tonybtw.com/tutorial/nixos-from-scratch/
* Read the guide above and keep the following in mind. 
  * **A)** Having a basic knowledge of git, nix flakes and NixOS will take you a long way in understanding the article and how to use my dotfiles to the greatest extent. You follow the tutorial up to the ```Install``` block. 
  * **B)** You are not going to make your own flake it is provided by this repository so, when prompted to use a flake git clone this repository into /mnt/etc/nixos using nix-shell to temporarily install git. You will need a flake to run ```nixos-install --flake``` and you will need to know which profile you are using in which the two valid profiles are ```blackmesa``` and ```themojave```. 
  * **C)** It is your choice but updating the system is streamlined through the moving of the dotfiles into a hidden folder that the builtin updating script utilizes. After install it is imperative that you do not use the git cloned repo in /etc/nixos but delete it and re-git-clone it in the home folder where you will run the ```install.sh```. Then and only then can you use the builtin ```world_update``` and ```boot_update``` If you desire to make any changes edit the ```nixos_config``` folder and re-run the ```install.sh``` script.
