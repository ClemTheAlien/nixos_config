{
services.polybar = {
  enable = true;
  script = "polybar main &";
  settings = {
    "colors" = {
      # Reads colors from XResources (Pywal)
      background = "\${xrdb:color0:#222}";
      background-alt = "\${xrdb:color10:#444}";
      foreground = "\${xrdb:color7:#dfdfdf}";
      primary = "\${xrdb:color5:#8c8c8c}";
      alert = "\${xrdb:color1:#bd2c40}";
    };

    "bar/main" = {
      width = "100%";
      height = 27;
      radius = 0;
      fixed-center = true;

      # Transparent bar background as per your Waybar CSS
      background = "#00000000";
      foreground = "\${colors.foreground}";

      font-0 = "Fira Code:size=12;2";
      
      modules-left = "xworkspaces";
      modules-center = "xwindow";
      modules-right = "cpu memory pulseaudio screenshot battery clock";

      module-margin = 0;
    };

    "module/xwindow" = {
      type = "internal/xwindow";
      label = "%title:0:50:...%";
      label-padding = 2;
    };

    "module/xworkspaces" = {
      type = "internal/xworkspaces";
      label-active = "%name%";
      label-active-background = "\${colors.background-alt}";
      label-active-padding = 2;

      label-occupied = "%name%";
      label-occupied-background = "\${colors.primary}";
      label-occupied-padding = 2;

      label-empty = "%name%";
      label-empty-background = "\${colors.primary}";
      label-empty-padding = 2;
    };

    "module/cpu" = {
      type = "internal/cpu";
      interval = 2;
      format = "CPU <label>";
      format-background = "\${colors.background-alt}";
      format-padding = 1;
      label = "%percentage%%";
    };

    "module/memory" = {
      type = "internal/memory";
      interval = 2;
      format = "Mem:<label>";
      format-background = "\${colors.background-alt}";
      format-padding = 1;
      label = "%percentage_used%%";
    };

    "module/pulseaudio" = {
      type = "internal/pulseaudio";
      format-volume = "Vol: <label-volume>";
      format-volume-background = "\${colors.background-alt}";
      format-volume-padding = 1;
    };

    "module/screenshot" = {
      type = "custom/text";
      content = " ⎙ ";
      content-background = "\${colors.background-alt}";
      # Note: grim/slurp are Wayland tools. 
      # If you are on X11, replace this with: maim -s | xclip -selection clipboard -t image/png
      click-left = "grim -g \"$(slurp)\" - | satty --filename -";
    };

    "module/battery" = {
      type = "internal/battery";
      full-at = 99;
      battery = "BAT0"; # Change to BAT1 if necessary
      adapter = "AC";
      format-charging = "<label-charging> ⚡︎";
      format-discharging = "<label-discharging> ⚡︎";
      format-charging-background = "\${colors.background-alt}";
      format-discharging-background = "\${colors.background-alt}";
      format-charging-padding = 1;
      format-discharging-padding = 1;
    };

    "module/clock" = {
      type = "internal/date";
      interval = 1;
      time = "%H:%M";
      date-alt = "%Y-%m-%d";
      label = "%time%";
      format-background = "\${colors.background-alt}";
      format-padding = 1;
    };
  };
};
}