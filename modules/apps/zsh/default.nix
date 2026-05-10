{ config, pkgs, ... }:{
programs.zsh ={
  enable = true;
  shellAliases = {
    world_update = "sudo nixos-rebuild switch --flake $HOME/.nixos_config#$HOST";
    home_update = "home-manager switch --flake $HOME/.nixos_config#clemmie@$HOST";
    update = "world_update && home_update";
    boot_update = "sudo nixos-rebuild boot --flake .nixos_config#$HOST";
  };
  loginExtra = ''
    export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
  '';
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  history.size = 10000;
  initContent = ''
    wal -R
clear
fastfetch
PS1="%B%{$fg%}[%{$fg%}%n%{$fg%}@%{$fg%}%M %{$fg%}%~%{$fg%}]%{$reset_color%}$%b "
  '';
};
}