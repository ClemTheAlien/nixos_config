{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs-all-the-icons-fonts
    cmake
    libtool
  ];
programs.emacs = {
  enable = true;
  package = pkgs.emacs;  # replace with pkgs.emacs-gtk if desired
  extraPackages = epkgs: with epkgs; [
      use-package
      doom-themes
      dashboard
      all-the-icons
      ivy
      counsel
      swiper
      diminish
      vterm
  ];
  extraConfig = builtins.readFile ./init.el;
};
}