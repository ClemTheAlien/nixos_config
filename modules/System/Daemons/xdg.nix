{ pkgs, ... }: {
  xdg.portal = {
    enable = true;
    # IMPORTANT: Setting this to false often fixes the "No Apps Available"
    # bug in Electron apps like Cursor by letting the system use xdg-open di>
    xdgOpenUsePortal = false;

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
};
}