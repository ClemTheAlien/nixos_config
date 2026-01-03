{
programs.alacritty = {
    enable = true;
    
    settings = {
      window = {
        opacity = 0.7;
        dynamic_padding = true;
        decorations = "none";
        startup_mode = "windowed";
      };

      scrolling = {
        multiplier = 6;
      };

      font = {
        normal = {
          family = "Departure Mono";
          style = "Regular";
        };
        glyph_offset = {
          x = -1;
          y = 0;
        };
        size = 8.5;
      };

      cursor = {
        style = {
          shape = "Beam";
          blinking = "Always";
        };
        unfocused_hollow = false;
      };

      mouse = {
        hide_when_typing = true;
      };
    };
  };
}