{ stdenv, lib, pkgs, ... }:

stdenv.mkDerivation {
  pname = "Jonafonts";
  version = "1.0";

  src = pkgs.fetchzip {
    url = "https://github.com/librepup/fonts/archive/refs/heads/main.zip";
    hash = "sha256-dPb9IHvIDst7z7MzO+MHx5n6hig1aW5Now8H0SUnNrk=";
  };

  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    mkdir -p $out/share/fonts/opentype
    mkdir -p $out/share/fonts/woff2

    # install all supported formats if present
    cp -v *.ttf $out/share/fonts/truetype 2>/dev/null || true
    cp -v *.otf $out/share/fonts/opentype 2>/dev/null || true
    cp -v *.woff2 $out/share/fonts/woff2 2>/dev/null || true
  '';

  meta = with lib; {
    description = "Jonafonts Fonts Bundle";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
