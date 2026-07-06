{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;

    # 1. Matching your exact extensions list
    extensions = [
      "make"
      "nix"
      "vscode-icons"
      "neocmake"
      "rose-pine-theme" # Provides Rosé Pine Moon
    ];

    # 2. Global Zed Configuration
    userSettings = {
      # Use your installed Rosé Pine Moon theme
      theme = "Rosé Pine Moon";

      # UI tweaks
      ui_font_size = 15;
      buffer_font_size = 14;

      # Let Zed auto-load Nix/Direnv environments per project
      load_direnv = "direct";

      # Explicitly configure ccls
      lsp = {
        ccls = {
          binary = {
            path = "ccls";
            arguments = [ ];
          };
        };
      };

      # Language overrides to enforce ccls and use formatting
      languages = {
        "C" = {
          format_on_save = "on";
          language_servers = [
            "ccls"
            "!clangd"
          ]; # Swap clangd for ccls
        };
        "C++" = {
          format_on_save = "on";
          language_servers = [
            "ccls"
            "!clangd"
          ];
        };
        "CMake" = {
          format_on_save = "on";
        };
        "Nix" = {
          format_on_save = "on";
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
      };
    };
  };
}
