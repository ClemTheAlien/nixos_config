{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/Home/vscodium.nix
    ./modules/Home/alacritty.nix
    ./modules/Home/fastfetch.nix
    ./modules/Home/Desktops/mangowc.nix
    ./modules/Home/Desktops/awesomewm.nix
    ./modules/Home/Desktops/pokewm.nix
    ./modules/Home/waybar.nix
    ./modules/Home/polybar.nix
    ./modules/Home/mako.nix
    ./modules/Home/picom.nix
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
    zotero
    yt-dlp
    hexchat
    anki
    fluffychat
    clementine
    mmex
    firefox
    keepassxc
    vesktop
    vlc
    libreoffice-fresh
    git
    github-cli
    act
    vscodium
    wireshark
    mullvad-vpn
    kicad
    logisim-evolution
    ghidra-bin
    krita
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

  programs.git = {
    enable = true;
    settings = {
    user.name = "ClemTheAlien";
    user.email = "ClemTheAlien@proton.me";
    };
  };
}
