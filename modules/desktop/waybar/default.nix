{ pkgs, ... }:

let
  # Rosé Pine Dawn Palette Variables (Light Theme)
  rose-pine-dawn = ''
    @define-color base         #faf4ed;
    @define-color surface      #fffaf3;
    @define-color overlay      #f2e9e1;
    @define-color muted        #9893a5;
    @define-color subtle       #797593;
    @define-color text         #575279;
    @define-color love         #b4637a;
    @define-color gold         #ea9d34;
    @define-color rose         #d7827e;
    @define-color pine         #286983;
    @define-color foam         #56949f;
    @define-color iris         #907aa9;
    @define-color highlightLow  #f4ede8;
    @define-color highlightMed  #dfdad9;
    @define-color highlightHigh #cecacd;
  '';
in
{
  # Ensures JetBrains Mono Nerd Font is installed for icons
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 38;
        spacing = 4;
        margin-top = 6;
        margin-left = 10;
        margin-right = 10;

        modules-left = [
          "ext/workspaces"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "pulseaudio"
          "battery"
        ];

        "ext/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          on-click-right = "deactivate";
          sort-by-id = true;
          ignore-hidden = true;
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
          };
        };

        "clock" = {
          format = "󰥔 {:%I:%M %p}";
          format-alt = "󰃭 {:%Y-%m-%d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          on-click = "xdg-open https://calendar.google.com";
        };

        "tray" = {
          icon-size = 18;
          spacing = 10;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 Muted";
          format-icons = {
            headphone = "";
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pwvucontrol";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };
      };
    };

    style = rose-pine-dawn + ''
      * {
        border: none;
        border-radius: 0;
        font-family: "Departure Mono", "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background-color: transparent;
        color: @text;
      }

      /* Base module pill style for Dawn light theme */
      #workspaces,
      #clock,
      #tray,
      #pulseaudio,
      #battery {
        background-color: @surface;
        padding: 4px 12px;
        margin: 4px 3px;
        border-radius: 8px;
        border: 1px solid @highlightMed;
      }

      /* Left Side */
      #custom-launcher {
        color: @pine;
        font-size: 16px;
        padding-right: 14px;
      }

      #workspaces button {
        padding: 0 5px;
        color: @subtle;
        border-radius: 4px;
      }

      #workspaces button.active {
        color: @foam;
        background-color: @overlay;
      }

      #workspaces button.urgent {
        color: @love;
      }

      #workspaces button:hover {
        background: @highlightMed;
        color: @text;
      }

      /* Center */
      #clock {
        color: @iris;
        font-weight: bold;
      }

      /* Right Side */
      #pulseaudio {
        color: @gold;
      }

      #battery {
        color: @rose;
      }

      #battery.charging, #battery.plugged {
        color: @foam;
      }

      #battery.critical:not(.charging) {
        background-color: @love;
        color: @base;
      }
    '';
  };
}
