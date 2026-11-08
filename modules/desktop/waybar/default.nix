{ pkgs, ... }:

let
  # Gruvbox Dark Soft Palette Variables
  gruvbox-dark-soft = ''
    @define-color base         #32302f;    /* Dark0 Soft (Background) */
    @define-color surface      #3c3836;    /* Dark1 (Surface) */
    @define-color overlay      #504945;    /* Dark2 (Overlay/Selection) */
    @define-color muted        #928374;    /* Gray (Muted text) */
    @define-color subtle       #a89984;    /* Light4 (Subtle text) */
    @define-color text         #ebdbb2;    /* Light1 (Main text) */
    @define-color love         #fb4934;    /* Bright Red */
    @define-color gold         #fabd2f;    /* Bright Yellow */
    @define-color rose         #fe8019;    /* Bright Orange */
    @define-color pine         #83a598;    /* Bright Blue */
    @define-color foam         #8ec07c;    /* Bright Aqua */
    @define-color iris         #d3869b;    /* Bright Purple */
    @define-color highlightLow  #282828;    /* Dark0 */
    @define-color highlightMed  #504945;    /* Dark2 */
    @define-color highlightHigh #665c54;    /* Dark3 */
  '';
in
{
  # Required dependencies for bar modules and styling
  home.packages = with pkgs; [
    departure-mono
    nerd-fonts.jetbrains-mono
    grim
    slurp
    libnotify
    pwvucontrol
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
          "custom/screenshot"
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

        "custom/screenshot" = {
          format = "󰄄";
          on-click = "grim -g \"$(slurp)\" - | wl-copy";
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
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
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
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };
      };
    };

    style = gruvbox-dark-soft + ''
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

      /* Base module pill style for Gruvbox Dark Soft */
      #workspaces,
      #clock,
      #custom-screenshot,
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

      #workspaces button.active,
      #workspaces button.focused {
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
      #custom-screenshot {
        color: @pine;
      }

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
