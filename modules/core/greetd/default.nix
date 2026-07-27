{ pkgs, ... }:

{
  # Enable greetd display manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # Using tuigreet with clock display and remembered last user
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd mango --sessions /run/current-system/sw/share/wayland-sessions:/run/current-system/sw/share/xsessions";
        user = "greeter";
      };
    };
  };

  # Optional: Ensure PAM allows tuigreet to authenticate properly
  security.pam.services.greetd.enableGnomeKeyring = true;
}
