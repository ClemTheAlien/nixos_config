{ config, pkgs, ... }:{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font-family = "Departure Mono";
      font-size = 8.5; 

      background-opacity = 0.7;
      background-blur = true;

      keybind = [
        "alt+t=new_tab"
        "alt+c=close_tab"
      ];

      command = "${pkgs.bash}/bin/bash -c '${pkgs.pywal}/bin/wal -R && clear && ${pkgs.fastfetch}/bin/fastfetch; exec ${pkgs.zsh}/bin/zsh'";
    };
  };

}