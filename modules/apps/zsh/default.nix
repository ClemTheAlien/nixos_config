{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lsd
    bat
    any-nix-shell
    fortune
    cowsay
  ];
  programs.zsh = {
    enable = true;
    initContent = ''
      any-nix-shell zsh --info-right | source /dev/stdin
      exfetch -l -s ': ' -c 5 -a 'Linux' -o user,os,ver,uptime,dewm,shell,term,pkgs
    '';
    loginExtra = ''
      export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
    '';

    shellAliases = {
      world_update = "sudo nixos-rebuild switch --flake $HOME/.nixos_config#$HOST";
      home_update = "home-manager switch --flake $HOME/.nixos_config#clemmie@$HOST";
      update = "world_update && home_update";
      boot_update = "sudo nixos-rebuild boot --flake .nixos_config#$HOST";
      ls = "lsd -l";
      cat = "bat";
      exfetch = "exfetch -l -s ': ' -c 5 -a 'Linux' -o user,os,ver,uptime,dewm,shell,term,pkgs";
      fortune = "(cowsay $(fortune))";
    };

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
    };
  };
}
