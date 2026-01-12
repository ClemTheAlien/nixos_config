{
programs.dankMaterialShell = {
  enable = true;

  systemd = {
    enable = true;             # Systemd service for auto-start
    restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
  };

  # Core features
  enableSystemMonitoring = true;     # System monitoring widgets (dgop)
  enableClipboard = true;            # Clipboard history manager
  enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
  enableAudioWavelength = true;      # Audio visualizer (cava)
  enableCalendarEvents = true;       # Calendar integration (khal)
};
programs.dankMaterialShell.greeter = {
  enable = true;
  compositor.name = "sway";
  configHome = "/home/clemmie";
};
}