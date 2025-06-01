if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root. Please run as root"
    exit
fi

rm -rf ~/nixos_config/assets
rm ~/nixos_config/README.md
mv ~/nixos_config/.zshrc ~/
mv ~/nixos_config/extraConfig ~/.extraConfig
mv ~/nixos_config/* ~/.config/
mv -f ~/nixos_config/configuration.nix /etc/nixos/

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.valvesoftware.Steam
flatpak install flathub org.prismlauncher.PrismLauncher
flatpak install flathub com.spotify.Client
flatpak install flathub com.github.tchx84.Flatseal

rm -rf ~/nixos_config
nixos-rebuild switch
nixos-rebuild boot --install-bootloader

echo "All Done :3"