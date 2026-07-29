{ config, pkgs, ... }:

{
  imports = [
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
    clementine
    keepassxc
    vlc
    cudatoolkit
    handbrake
    makemkv
    mkvtoolnix
    obs-studio
    curtail
    metadata-cleaner
    librewolf-bin
    waypaper
    swaybg
    git
    lsd
    bat
    any-nix-shell

    # Font packages
    fontconfig
    (pkgs.writeShellScriptBin "fc-cache-setup" ''
      mkdir -p /home/clemmie/.cache/fontconfig
      ${pkgs.fontconfig}/bin/fc-cache -fv
    '')
  ];

  # Font configuration to fix cache issues
  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
