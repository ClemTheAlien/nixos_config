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
      # Gruvbox Dark Soft
      colors = {
        background = "32302fff";
        text = "ebdbb2ff";
        prompt = "fb4934ff";
        placeholder = "928374ff";
        input = "ebdbb2ff";
        match = "fabd2fff";
        selection = "504945ff";
        selection-text = "ebdbb2ff";
        selection-match = "fabd2fff";
        border = "d65d0eff";
      };
    };
  };
}
