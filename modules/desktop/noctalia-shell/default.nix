{ config, pkgs, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    
    # Plugin management (sources and states)
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        pomodoro = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
    };

    # Main shell configuration
    settings = {
      settingsVersion = 53;

      general = {
        avatarImage = "${config.home.homeDirectory}/.face";
        lockOnSuspend = true;
        showChangelogOnStartup = true;
        clockFormat = "hh\\nmm";
        clockStyle = "custom";
        enableShadows = true;
        animationSpeed = 1;
      };

      ui = {
        fontDefault = "Fira Code";
        fontFixed = "Departure Mono";
        panelBackgroundOpacity = 0.93;
        tooltipsEnabled = true;
        panelsAttachedToBar = true;
      };

      appLauncher = {
        enableClipPreview = true;
        enableClipboardHistory = false;
        sortByMostUsed = true;
        iconMode = "tabler";
        viewMode = "list";
        terminalCommand = "xterm -e";
        position = "center";
      };

      audio = {
        visualizerType = "linear";
        cavaFrameRate = 30;
        volumeStep = 5;
      };

      bar = {
        barType = "floating";
        position = "top";
        backgroundOpacity = 0.93;
        floating = true;
        frameRadius = 12;
        widgets = {
          left = [
            { id = "Battery"; displayMode = "onhover"; }
            { id = "Clock"; formatHorizontal = "HH:mm ddd, MMM dd"; }
          ];
          center = [
            { id = "Workspace"; characterCount = 2; showBadge = true; }
          ];
          right = [
            { id = "Volume"; displayMode = "onhover"; }
            {
              id = "CustomButton";
              icon = "cash-heart";
              leftClickExec = "grim -g \"$(slurp)\" - | satty --filename -";
            }
            { id = "plugin:pomodoro"; }
            { id = "ControlCenter"; icon = "analyze"; }
          ];
        };
      };

      controlCenter = {
        position = "close_to_bar_button";
        cards = [
          { enabled = true; id = "profile-card"; }
          { enabled = true; id = "shortcuts-card"; }
          { enabled = true; id = "audio-card"; }
          { enabled = true; id = "brightness-card"; }
          { enabled = true; id = "weather-card"; }
          { enabled = true; id = "media-sysmon-card"; }
        ];
      };

      notifications = {
        enabled = true;
        location = "top_right";
        backgroundOpacity = 1;
      };

      wallpaper = {
        enabled = true;
        directory = "${config.home.homeDirectory}/.wallpapers";
        transitionType = "random";
        wallpaperChangeMode = "random";
      };

      colorSchemes = {
        darkMode = false;
        useWallpaperColors = true;
        generationMethod = "vibrant";
      };
    };
  };
}