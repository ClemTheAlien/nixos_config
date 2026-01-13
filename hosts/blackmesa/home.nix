{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/Home/alacritty.nix
    ./modules/Home/fastfetch.nix
    ./modules/Home/Desktops/mangowc.nix
    ./modules/Home/Desktop/dank-material-shell.nix
  ];

  home.enableNixpkgsReleaseCheck = false;
  home.username = "clemmie";
  home.homeDirectory = "/home/clemmie";
  home.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "nano";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    XDG_CACHE_HOME = "/home/clemmie/.cache";  # Ensure cache directory is set
  };

  home.packages = with pkgs; [
    hexchat
    fluffychat
    clementine
    firefox
    keepassxc
    vesktop
    lutris
    cudatoolkit
    handbrake
    makemkv
    mkvtoolnix
    curtail

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

  programs.git = {
    enable = true;
    settings = {
    user.name = "ClemTheAlien";
    user.email = "ClemTheAlien@proton.me";
    };
  };
}
