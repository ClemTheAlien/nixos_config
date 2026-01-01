{config, pkgs,...}:
{
  home.packages = with pkgs; [
    nitrogen
    polybar
];
}