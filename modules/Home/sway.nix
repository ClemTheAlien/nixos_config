{
    wayland.windowManager.sway = {
    enable = true;
    
    # Use SwayFX if you want the extra features, otherwise stick with regular Sway
    package = pkgs.sway;  # Use pkgs.swayfx for SwayFX features
    
    config = let
      mod = "Mod4";
      terminal = "alacritty";
      menu = "rofi -show drun";
    in {
      modifier = mod;
      inherit terminal menu;      
      
      keybindings = {
        "${mod}+Return" = "exec ${terminal}";
        "${mod}+Shift+c" = "kill";
        "${mod}+r" = "exec ${menu}";
        "${mod}+Shift+r" = "reload";
        "${mod}+Shift+e" = "exec swaynag -t warning -m 'Do you really want to exit sway?' -b 'Yes' 'swaymsg exit'";
        
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";
        
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";
        
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";
        
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
        
        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        "${mod}+f" = "fullscreen";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+a" = "focus parent";
        
        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";
        
        "${mod}+Shift+a" = "mode \"resize\"";
        
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        "Print" = "exec grim";
      };
      
      modes.resize = {
        "h" = "resize shrink width 10px";
        "j" = "resize grow height 10px";
        "k" = "resize shrink height 10px";
        "l" = "resize grow width 10px";
        "Left" = "resize shrink width 10px";
        "Down" = "resize grow height 10px";
        "Up" = "resize shrink height 10px";
        "Right" = "resize grow width 10px";
        "Return" = "mode \"default\"";
        "Escape" = "mode \"default\"";
      };
      
      window = {
        border = 0;
        titlebar = false;
        hideEdgeBorders = "both";
      };
      
      floating = {
        border = 0;
        titlebar = false;
      };
      
      gaps = {
        inner = 10;
        outer = 10;
      };
      
      bars = [];
    };
    
    # FIXED: Remove SwayFX-specific features for regular Sway
    extraConfig = ''
      # Wallpaper
      exec ${pkgs.swaybg}/bin/swaybg -i /path/to/your/wallpaper.jpg
      
      # Floating modifier
      floating_modifier Mod4
      
      # Include system configs
      include /etc/sway/config.d/*
    '';
    
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
      
      # Fix font cache
      mkdir -p /home/clemmie/.cache/fontconfig
      ${pkgs.fontconfig}/bin/fc-cache -fv
	exec waybar --log-level=warning
    '';
  };
}