# Welcome to ClemTheAlien's NixOS Dotfiles for Desktop Usage!
These dotfiles require an exact or similar layout of my configuration.nix file in order to function. These dots should be applicable across most distros if you download the applications listed in my configuration.nix file while also copying the folders to the .config folder. Warning that these dots were made with NixOS in mind.
## Additional Warnings
- I make sure my Kernel is the most bleeding edge to fix my devices audio issues (it is not nessecary to use bleeding-edge kernel for my dots to work)
- I omitted my Timezone and Hostname in the config so make sure to edit that
- I have Unfree Packages enabled (its just android studio)
- I use ZSH instead of BASH and I use the autosuggestion and syntax higlighting plugins, in which I git clone to .zsh 

If you are curious on why every component is needed read my configuration.nix file and it should explain everything. Before you remove anything consult every file to see if there is any stragglers.

Pywal is connected to the .zshrc, rofi, awesome, alacritty files and applications
Picom is connected to the alacritty.toml file
Fasfetch is connected to the .zshrc file
Nitrogen is connected to awesome and .zshrc files and folder (yes i went overkill making sure my wallpaper always appeared)

## Flatpak
I also have flatpak just in case I need to download something quick.

Most of these notes are for future maintenece on my part :>
I do not know how to use flakes or home manager yet so dont judge me.

## TODO
1. Try to switch to Wayland
2. Instead of SpaceFM try using a TUI file manager
3. Add Nvidia drivers and stuff for gaming instead of dual-booting CachyOS (last time I installed Nvidia on NixOS my bootloader killed itself)
4. Make script to install everything
