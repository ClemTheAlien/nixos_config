{ config, pkgs, ... }:
{
  # Packages
  environment.systemPackages = with pkgs; [
    # System Tools
    home-manager
    bluez # bluetooth
    bluez-tools # bluetooth
    blueman # bluetooth gui
    pwvucontrol # audio gui
    nautilus # file manager
    networkmanagerapplet # network gui
    feh # image viewer
    wl-clipboard # clipboard

    webcamoid # webcam
    ghostty # terminal
    cava # audio visualizer
    grim # screenshot
    satty # screenshot
    slurp # screenshot
  ];
}
