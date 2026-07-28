{
  programs.hyprlock = {
    enable = true;

    settings = {
      background = [
        {
          monitor = "";
          color = "rgb(faf4ed)"; # Base background
          clear_password = true;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 50";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.35;
          dots_center = true;

          outer_color = "rgb(fffaf3)"; # Surface
          inner_color = "rgb(fffaf3)"; # Surface
          font_color = "rgb(575279)";  # Text

          fade_on_empty = false;
          rounding = 10;

          placeholder_text = "";
          fail_text = "try again...";

          position = "0, -60";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          color = "rgb(575279)"; # Text
          font_size = 64;
          font_family = "Departure Mono";
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo -e \"$USER@$HOSTNAME \\n$(date +'%A, %B %d')\"";
          color = "rgb(9893a5)"; # Subdued
          font_size = 14;
          font_family = "Departure Mono";
          position = "0, 10";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
