	{ config, pkgs, ... }: {
xdg.mime.defaultApplications = {
  # Images with feh
  "image/jpeg" = "feh.desktop";
  "image/png" = "feh.desktop";
  "image/gif" = "feh.desktop";
  "image/bmp" = "feh.desktop";
  "image/svg+xml" = "feh.desktop";

  # Videos with VLC
  "video/mp4" = "vlc.desktop";
  "video/x-matroska" = "vlc.desktop";
  "video/x-flv" = "vlc.desktop";

  # Documents with LibreOffice
  "application/vnd.oasis.opendocument.text" = "libreoffice-writer.desktop";
  "application/vnd.oasis.opendocument.spreadsheet" = "libreoffice-calc.desktop";
  "application/vnd.oasis.opendocument.presentation" = "libreoffice-impress.desktop";
  "application/pdf" = "libreoffice-writer.desktop";

  # Code files with VSCodium
  "text/plain" = "codium.desktop";
  "text/x-c++src" = "codium.desktop";
  "text/x-python" = "codium.desktop";
  "text/html" = "codium.desktop";
  "application/javascript" = "codium.desktop";
	};
  }