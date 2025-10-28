{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/Home/vscodium.nix
    ./modules/Home/alacritty.nix
    ./modules/Home/fastfetch.nix
    ./modules/Home/mangowc.nix
    ./modules/Home/waybar.nix
    ./modules/Home/mako.nix
  ];

  home.enableNixpkgsReleaseCheck = false;
  home.username = "clemmie";
  home.homeDirectory = "/home/clemmie";
  home.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;

  # Fix fontconfig cache issues
  xdg.cacheHome = "/home/clemmie/.cache";

  home.sessionVariables = {
    EDITOR = "nano";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    XDG_CACHE_HOME = "/home/clemmie/.cache";  # Ensure cache directory is set
  };

  home.packages = with pkgs; [
    mmex
    firefox
    keepassxc
    vesktop
    weechat
    lutris
    vlc
    libreoffice-fresh
    git
    github-cli
    act
    vscodium
    cudatoolkit
    wireshark
    mullvad-vpn
    kicad
    logisim-evolution
    ghidra-bin
    krita
    obs-studio
    handbrake
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

  programs.git = {
    enable = true;
    settings = {
    user.name = "ClemTheAlien";
    user.email = "ClemTheAlien@proton.me";
    };
  };
}