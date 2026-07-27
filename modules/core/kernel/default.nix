{ config, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot = {
      # Silence kernel log messages on the console
      consoleLogLevel = 0;

      # Silence NixOS stage 1 (initrd) script verbosity
      initrd.verbose = false;

      # Pass parameters directly to the kernel command line
      kernelParams = [
        "quiet"                  # Suppress most kernel messages
        "splash"                 # Optional: enables splash screen support
        "boot.shell_on_fail"     # Drops to shell if boot fails despite quiet mode
        "loglevel=3"             # Show only critical kernel errors
        "rd.systemd.show_status=false" # Suppress systemd status messages in initrd
        "rd.udev.log_level=3"    # Suppress udev log output in initrd
        "udev.log_priority=3"    # Suppress udev log output in system
        "vt.global_cursor_default=0" # Hide the blinking cursor on the TTY
      ];
      loader.timeout = 0;
    };
}
