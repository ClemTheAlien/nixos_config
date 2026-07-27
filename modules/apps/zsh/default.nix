{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    # 1. Run fastfetch instantly before plugins load
    initExtraFirst = ''
      if [[ -o interactive && -z "$TMUX" && -z "$ZELLIJ" ]]; then
        fastfetch
      fi
    '';

    # 2. Fast completion caching
    completionInit = ''
      autoload -Uz compinit
      if [ "$(date +'%j')" != "$(stat -c '%Y' ~/.zcompdump 2>/dev/null | date +'%j')" ]; then
        compinit
      else
        compinit -C
      fi
    '';

    # 3. Custom prompt and extra interactive setup
    initExtra = ''
      PS1="%B%{$fg[green]%}[%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[green]%}%M %{$fg[blue]%}%~%{$fg[green]%}]%{$reset_color%}$%b "
    '';

    loginExtra = ''
      export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
    '';

    shellAliases = {
      world_update = "sudo nixos-rebuild switch --flake $HOME/.nixos_config#$HOST";
      home_update = "home-manager switch --flake $HOME/.nixos_config#clemmie@$HOST";
      update = "world_update && home_update";
      boot_update = "sudo nixos-rebuild boot --flake .nixos_config#$HOST";
    };

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
    };
  };
}
