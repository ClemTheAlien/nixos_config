if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root. Please run as root"
    exit
fi

echo Hello, what is ur username?
read user

rm -rf /home/$user/nixos_config/assets
rm /home/$user/nixos_config/README.md
cp -r /home/$user/nixos_config/.zshrc ~
rm .zshrc
cp -r /home/$user/nixos_config/extraConfig ~/.extraConfig
rm -rf /home/$user/nixos_config/extraConfig
cp -r /home/$user/nixos_config/configuration.nix /etc/nixos/
rm /home/$user/nixos_config/configuration.nix
cp -r /home/$user/nixos_config/* ~/.config/

rm -rf /home/$user/nixos_config
nixos-rebuild boot --install-bootloader

echo "All Done :3"