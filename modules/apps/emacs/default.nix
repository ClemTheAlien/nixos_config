{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs-all-the-icons-fonts
    cmake
    libtool
    pandoc
  ];
programs.emacs = {
  enable = true;
  package = pkgs.emacs-pgtk;  # replace with pkgs.emacs-gtk if desired
  extraPackages = epkgs: with epkgs; [
    magit           
      transient       
      with-editor
      use-package
      doom-themes
      dashboard
      all-the-icons
      ivy
      counsel
      swiper
      diminish
      vterm
      org-modern
      org-roam
      org-roam-ui
  ];
  extraConfig = builtins.readFile ./init.el;
};
}