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
      theme = "Rosé Pine Dawn";

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

      # Language overrides (CRITICAL: Must be lowercase in Zed!)
      languages = {
        "c" = {
          format_on_save = "on";
          language_servers = [
            "ccls"
            "!clangd" # Disables the default built-in clangd
          ];
        };
        "c++" = {
          format_on_save = "on";
          language_servers = [
            "ccls"
            "!clangd"
          ];
        };
        "cmake" = {
          format_on_save = "on";
          language_servers = [
            "neocmake" # Explicitly hook up your extension's server
          ];
        };
        "nix" = {
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
