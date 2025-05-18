# Installation Guide
- For all folders except the `assets` and `limine` folder, copy n paste it into the .config folder and add a . to the beginning of all the folder names
- Move `.zshrc` to your `~/` and `configuration.nix` to the `/etc/nixos directory`
- Move `./limine/limine.conf` to `boot/limine` and `./limine/boot.jpg` to `/boot/limine/wallpapers`
- Then move on to the Manual Config section and complete each step
- Finally delete the `assets` folder, `README.md` and this file and your done :)

# Manual Config
## Installing Zsh plugins
Go to your home folder, and make a `.zsh` folder in which youll git clone these repos:
* [Zsh Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [Zsh Syntax Highlight](https://github.com/zsh-users/zsh-syntax-highlighting)