{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "make"
      "nix"
      "vscode-icons"
      "neocmake"
      "assembly"
      "rose-pine-theme"
    ];

    userSettings = {
      theme = "Rosé Pine Dawn";
      ui_font_size = 15;
      buffer_font_size = 14;
      load_direnv = "direct";
      lsp = {
        clangd = {
          binary = {
            path = "clangd";
          };
        };
        nil = {
          binary = {
            path = "nil";
          };
        };
      };

      # 2. Format on save configurations for both languages
      languages = {
        "C++" = {
          format_on_save = "on";
          formatter = {
            external = {
              command = "clang-format";
              arguments = [ "--query-driver=/nix/store/*" ];
            };
          };
        };
        "Nix" = {
          format_on_save = "on";
          formatter = {
            external = {
              command = "nixpkgs-fmt"; # or "alejandra"
            };
          };
        };
      };
    };
  };
  home.file.".gdbinit".text = ''
    set disassembly-flavor intel
  '';
}
