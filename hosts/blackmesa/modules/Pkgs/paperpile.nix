{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "paperpile";
  
  src = pkgs.fetchFromGitHub {
    owner = "jondo";
    repo = "paperpile";
    rev = "master";
    sha256 = "sha256-XTQ1f+Bkg/Q3ySUhxj9sbjyUA4olrVsDVqUFPnMoqJ0=";
  };
  
  nativeBuildInputs = [ pkgs.autoPatchelfHook ];
  
  buildInputs = [
    pkgs.stdenv.cc.cc.lib
    pkgs.xorg.libX11
    pkgs.xorg.libXext
    pkgs.glib
    pkgs.fontconfig
    pkgs.freetype
  ];
  
  # Ignore missing Qt libraries - they should be bundled
  autoPatchelfIgnoreMissingDeps = [
    "libQtWebKit.so.4"
    "libQtGui.so.4"
    "libQtNetwork.so.4"
    "libQtCore.so.4"
  ];
  
  dontBuild = true;
  dontStrip = true;
  
  installPhase = ''
    mkdir -p $out/bin $out/lib
    
    # Copy the binary
    cp qt/linux64/bin/paperpile $out/bin/
    
    # Copy bundled libraries
    if [ -d qt/linux64/lib ]; then
      cp -r qt/linux64/lib/* $out/lib/ 2>/dev/null || true
    fi
    
    # Set RPATH to include our lib directory
    patchelf --set-rpath "$out/lib:$(patchelf --print-rpath $out/bin/paperpile)" $out/bin/paperpile || true
    
    chmod +x $out/bin/paperpile
  '';
}