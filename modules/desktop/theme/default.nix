{ pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Gruvbox-Plus";
      package = pkgs.gruvbox-plus-icons;
    };

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };
}
