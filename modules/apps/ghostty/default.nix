{
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
    };
  };

}