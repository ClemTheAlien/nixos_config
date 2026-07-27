{ pkgs, ... }:

{
  # 1. Enable pointerCursor (handles GTK/X11/Wayland linkage)
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24; # Adjust size if needed
  };

  # 2. Your GTK config
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Light";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "rose-pine-dawn";
      package = pkgs.rose-pine-gtk-theme;
    };

    # gtk.cursorTheme can be omitted if home.pointerCursor.gtk.enable = true is set
  };
}
