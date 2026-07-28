{
  pkgs,
  lib,
  config,
  ...
}:
{
  languages = {
    nix.enable = true;
  };

  git-hooks = {
    hooks = {
      treefmt.enable = true;
    };
  };

  packages = [
    pkgs.nixfmt-rfc-style
  ];
}
