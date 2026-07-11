{ config, pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "Rose Pine Dawn";
      font-family = "Departure Mono";
      font-size = 8.5;

      background-opacity = 1;
      background-blur = true;

      keybind = [
        "alt+t=new_tab"
        "alt+c=close_tab"
      ];
      confirm-close-surface = false;
    };
  };

}
