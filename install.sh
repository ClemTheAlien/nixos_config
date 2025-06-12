
echo Hello, what is ur username?
read user

echo Nice to meet you :3
echo I need you to check the main config to make sure ur hostname and timezone are right. Also feel free to change anything else.
sleep 10
nano /home/$user/nixos_config/configuration.nix

rm -rf /home/$user/nixos_config/assets
rm /home/$user/nixos_config/README.md
cp -r /home/$user/nixos_config/.zshrc /home/$user
cp -r /home/$user/nixos_config/extraConfig /home/$user/.extraConfig
cp -r /home/$user/nixos_config/configuration.nix /etc/nixos/
cp -r /home/$user/nixos_config/* /home/$user/.config/

rm -rf /home/$user/nixos_config
rm .zshrc
rm -rf /home/$user/nixos_config/extraConfig
rm /home/$user/nixos_config/configuration.nix
sudo nixos-rebuild boot --install-bootloader

echo "All Done :3"