{config, pkgs,...}:
{
  home.packages = with pkgs; [
    nitrogen
    picom
    flameshot
];
}
