{ config, pkgs, ... }:

{
  imports = [
   ../../modules/apps/vscodium
   ../../modules/apps/alacritty
   ../../modules/apps/fastfetch
   ../../modules/desktop/mangowc
   ../../modules/desktop/noctalia-shell
   ../../modules/apps/git
   ../../modules/apps/zsh
   ../../modules/apps/emacs
  ];

  home.enableNixpkgsReleaseCheck = false;
  home.username = "clemmie";
  home.homeDirectory = "/home/clemmie";
  home.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nano";
    TERMINAL = "alacritty";
    XDG_CACHE_HOME = "/home/clemmie/.cache";  # Ensure cache directory is set
  };

  home.packages = with pkgs; [
    clementine
    keepassxc
    vesktop
    vlc
    cudatoolkit
    handbrake
    makemkv
    mkvtoolnix
    obs-studio
    curtail
    metadata-cleaner
    
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
