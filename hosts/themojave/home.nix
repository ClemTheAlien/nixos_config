{ config, pkgs, ... }:

{
  imports = [
    ../../modules/apps/zed
    ../../modules/apps/ghostty
    ../../modules/apps/fastfetch
    ../../modules/desktop/mangowc
    ../../modules/apps/git
    ../../modules/apps/zsh
    ../../modules/desktop/fuzzel
    ../../modules/desktop/theme
    ../../modules/desktop/waybar
    ../../modules/desktop/hyprlock
  ];

  home.username = "clemmie";
  home.homeDirectory = "/home/clemmie";
  home.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nano";
    TERMINAL = "ghostty";
    XDG_CACHE_HOME = "/home/clemmie/.cache"; # Ensure cache directory is set
  };

  home.packages = with pkgs; [
    zotero
    anki
    clementine
    keepassxc
    vlc
    libreoffice-fresh
    git
    github-cli
    act
    nix-direnv
    direnv
    krita
    obs-studio
    curtail
    metadata-cleaner
    librewolf-bin
    waypaper
    swaybg

    # Font packages
    fontconfig
    (pkgs.writeShellScriptBin "fc-cache-setup" ''
      mkdir -p /home/clemmie/.cache/fontconfig
      ${pkgs.fontconfig}/bin/fc-cache -fv
    '')
  ];
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}
