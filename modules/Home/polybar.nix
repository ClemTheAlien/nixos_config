{pkgs,...}:
{
services.polybar = {
  enable = true;
  script = "polybar main &";
  package = pkgs.polybar.override {
    pulseSupport = true;
  };
  settings = {
    "colors" = {
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
      background = "#00000000";
      foreground = "\${colors.foreground}";

      font-0 = "Fira Code:size=12;2";
      font-1 = "Symbols Nerd Font:size=12;2";
      
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
      format = "<label>";
      format-prefix = " CPU ";
      format-background = "\${colors.background-alt}";
      format-padding = 0;
      label = "%percentage%% ";
    };

    "module/memory" = {
      type = "internal/memory";
      interval = 2;
      format = "<label>";
      format-prefix = " Mem: ";
      format-background = "\${colors.background-alt}";
      format-padding = 0;
      label = "%percentage_used%% ";
    };

"module/pulseaudio" = {
      type = "internal/pulseaudio";
      # Adding spaces inside the quotes forces the background color to show on transparent bars
      format-volume = " Vol: <label-volume> ";
      format-volume-background = "\${colors.background-alt}";
      
      format-muted = " Vol: Muted ";
      format-muted-background = "\${colors.background-alt}";

      # PipeWire volume adjustment
      scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
      scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      click-left = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    };
    "module/screenshot" = {
      # Changed from custom/text to custom/script to force background rendering
      type = "custom/script";
      exec = "echo \" S \"";
      interval = 1000;
      format-background = "\${colors.background-alt}";
      format-padding = 1;
      click-left = "flameshot gui";
    };

    "module/battery" = {
      type = "internal/battery";
      full-at = 100;
      battery = "BAT0"; 
      adapter = "AC";
      
      format-charging = " <label-charging> ⚡︎ ";
      format-discharging = " <label-discharging> ⚡︎ ";
      format-full = " <label-full> ⚡︎ ";
      
      format-charging-background = "\${colors.background-alt}";
      format-discharging-background = "\${colors.background-alt}";
      format-full-background = "\${colors.background-alt}";
    };

    "module/clock" = {
      type = "internal/date";
      interval = 1;
      time = " %H:%M ";
      date-alt = " %Y-%m-%d ";
      label = "%time%";
      format-background = "\${colors.background-alt}";
    };
  };
};
}
