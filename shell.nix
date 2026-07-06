{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {

  nativeBuildInputs = with pkgs; [
    nixfmt
    nil
    nixd
  ];

  shellHook = ''
    echo "❄️ Nix development environment loaded!"
  '';
}
