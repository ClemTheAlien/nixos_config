{ config, lib, pkgs, ... }:

{
  home.enableNixpkgsReleaseCheck = false;
  home.username = "clemmie";
  home.homeDirectory = "/home/clemmie";
  home.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;

  # Fix fontconfig cache issues
  xdg.cacheHome = "/home/clemmie/.cache";

  home.sessionVariables = {
    EDITOR = "nano";
    BROWSER = "librewolf";
    TERMINAL = "alacritty";
    XDG_CACHE_HOME = "/home/clemmie/.cache";  # Ensure cache directory is set
  };

  home.packages = with pkgs; [
    mmex
    librewolf
    keepassxc
    vesktop
    weechat
    lutris
    vlc
    libreoffice-fresh
    git
    github-cli
    act
    vscodium
    cudatoolkit
    wireshark
    mullvad-vpn
    kicad
    logisim-evolution
    ghidra-bin
    krita
    obs-studio
    handbrake
    curtail
    metadata-cleaner
    
    # Font packages
    fontconfig
    (pkgs.writeShellScriptBin "fc-cache-setup" ''
      mkdir -p /home/clemmie/.cache/fontconfig
      ${pkgs.fontconfig}/bin/fc-cache -fv
    '')
  ];

  # Font configuration to fix cache issues
  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
    user.name = "ClemTheAlien";
    user.email = "ClemTheAlien@proton.me";
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };

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

  programs.fastfetch = {
    enable = true;
    
    settings = {
      
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "local_ip"
        "disk"
        "break"
        "colors"
      ];
    };
  };

  services.mako = {
    enable = true;
    settings = {
    border-color= "#00000000";
    background-color= "#00000000";
    font = "Departure Mono 10";
    };
  };

wayland.windowManager.mango = {
   enable = true;
   settings = ''
#Layout
# tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
tagrule=id:1,layout_name:tile
tagrule=id:2,layout_name:tile
tagrule=id:3,layout_name:tile
tagrule=id:4,layout_name:tile
tagrule=id:5,layout_name:tile
tagrule=id:6,layout_name:tile
tagrule=id:7,layout_name:tile
tagrule=id:8,layout_name:vertical_scroller
tagrule=id:9,layout_name:scroller
#Keys
bind=SUPER,Return,spawn,alacritty
bind=SUPER+SHIFT,c,killclient,
bind=SUPER,r,spawn,rofi -show drun
bind=SUPER+SHIFT,r,reload_config
bind=SUPER+SHIFT,e,quit,

bind=SUPER,Left,focusdir,left
bind=SUPER,Down,focusdir,down
bind=SUPER,Up,focusdir,up
bind=SUPER,Right,focusdir,right

bind=SUPER+SHIFT,Left,exchange_client,left
bind=SUPER+SHIFT,Down,exchange_client,down
bind=SUPER+SHIFT,Up,exchange_client,up
bind=SUPER+SHIFT,Right,exchange_client,right

bind=SUPER,1,view,1
bind=SUPER,2,view,2
bind=SUPER,3,view,3
bind=SUPER,4,view,4
bind=SUPER,5,view,5
bind=SUPER,6,view,6
bind=SUPER,7,view,7
bind=SUPER,8,view,8
bind=SUPER,9,view,9
bind=SUPER,0,view,10

bind=SUPER+SHIFT,1,tag,1
bind=SUPER+SHIFT,2,tag,2
bind=SUPER+SHIFT,3,tag,3
bind=SUPER+SHIFT,4,tag,4
bind=SUPER+SHIFT,5,tag,5
bind=SUPER+SHIFT,6,tag,6
bind=SUPER+SHIFT,7,tag,7
bind=SUPER+SHIFT,8,tag,8
bind=SUPER+SHIFT,9,tag,9
bind=SUPER+SHIFT,0,tag,10

        '';
   autostart_sh =''
        waybar &
        waypaper --restore
        '';
  };

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

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      @import "/home/clemmie/.cache/wal/colors-waybar.css";
      
      * {
          border: none;
          border-radius: 0;
          font-family: Fira Code;
          font-size: 16px;
          min-height: 0;
          color: @color7;
      }
      
      window#waybar {
          background-color: transparent;
      }
      
      #workspaces button:first-child {
          border-left: 0;
      }
      
      #workspaces button {
          padding-left: 10px;
          padding-right: 10px;
          background-color: @color5;
          color: inherit;
          font-weight: 600;
      }

      #workspaces button.focused {
          background: @color10;
          color: inherit;
      }
      
      #pulseaudio, #cpu, #battery, #memory, #clock, #custom-screenshot, #custom-screenshot2 {
          padding-left: 8px;
          padding-right: 8px;
          background-color: @color10;
          color: inherit;
          font-weight: 600;
          border-radius: 25px;
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        "modules-left" = [ "hyprland/workspaces" "ext/workspaces"];
        "modules-center" = [ "hyprland/window" "dwl/window" ];
        "modules-right" = [ "cpu" "memory" "pulseaudio" "custom/screenshot" "custom/screenshot2" "battery" "clock" ];
        
        "hyprland/window" = {
          "max-length" = 50;
        };
        
        "battery" = {
          "format" = "{capacity}% {icon}";
          "format-icons" = [ "⚡︎" ];
        };
        
        "clock" = {
          "format" = "{:%H:%M}";
          "tooltip-format" = "{:%Y-%m-%d}";
        };

        "cpu" = {
          "format" = "{icon0} {icon1} {icon2} {icon3}";
          "format-icons" = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };
        
        "memory" = {
          "format" = "Mem:{percentage}%";
        };
        
        "pulseaudio" = {
          "format" = "Vol: {volume}%";
        };
        
        "custom/screenshot" = {
          "format" = "{icon}";
          "on-click" = "flameshot gui -c";
          "format-icons" = [ "⎙" ];
        };
        
        "custom/screenshot2" = {
          "format" = "{icon}";
          "on-click" = "flameshot gui";
          "format-icons" = [ "⎙/" ];
        };
      };
    };
  };

}
