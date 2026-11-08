{ config, pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font-family = "Departure Mono";
      font-size = 12;

      # macOS Glass / Vibrancy Configuration
      background-opacity = 0.75;
      background-blur-radius = 20;
      macos-titlebar-style = "transparent";

      # Window Polish
      window-padding-x = 12;
      window-padding-y = 12;

      keybind = [
        "alt+t=new_tab"
        "alt+c=close_tab"
      ];
      confirm-close-surface = false;
    };
  };
}
