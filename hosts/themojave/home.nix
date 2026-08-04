{
  config,
  pkgs,
  inputs,
  ...
}:

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
    ../../modules/desktop/starship
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
  home.packages = [
    inputs.exfetch.packages.${pkgs.system}.default
    inputs.vm-curator.packages.${pkgs.system}.default
  ]
  ++ (with pkgs; [
    qemu
    zotero
    anki
    clementine
    keepassxc
    vlc
    libreoffice-fresh
    git
    devenv
    krita
    obs-studio
    curtail
    metadata-cleaner
    librewolf-bin
    waypaper
    swaybg

    fontconfig
    (writeShellScriptBin "fc-cache-setup" ''
      mkdir -p /home/clemmie/.cache/fontconfig
      ${fontconfig}/bin/fc-cache -fv
    '')
  ]);
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
}
