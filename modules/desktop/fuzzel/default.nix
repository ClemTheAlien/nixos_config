{ pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
              # Departure Mono rendered at its pixel-perfect size (11px / 11pt)
              font = "Departure Mono:size=8";

              terminal = "${pkgs.ghostty}/bin/ghostty";
              layer = "overlay";
              prompt = "❯ ";
              icon-theme = "Papirus-Light";
              fields = "filename,name,generic,exec,categories,keywords";
              show-actions = "yes";

              # Compact Noctalia-style launcher layout
              width = 25;
              lines = 7;
              horizontal-pad = 16;
              vertical-pad = 12;
              inner-pad = 6;
              line-height = 20;
            };

      border = {
        width = 2;
        radius = 8;
      };

      # Rosé Pine Dawn Color Palette (RRGGBBAA format)
      colors = {
        background = "faf4edff";      # Base (Light Cream)
        text = "575279ff";            # Text (Dark Slate)
        prompt = "d7827eff";          # Rose
        placeholder = "9893a5ff";     # Muted
        input = "575279ff";           # Text
        match = "d7827eff";           # Highlight matching letters
        selection = "f2e9e1ff";       # Highlighted Row (Surface)
        selection-text = "575279ff";  # Selected Text
        selection-match = "d7827eff"; # Match inside selected row
        border = "d7827eff";          # Rose Pine Dawn Border
      };
    };
  };
}
