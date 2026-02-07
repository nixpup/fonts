{ stdenv, lib, pkgs, fetchgit, fetchFromGitHub, ... }:

stdenv.mkDerivation {
  pname = "Jonafonts";
  version = "1.0";

  src = fetchgit {
    url = "https://github.com/librepup/fonts";
    rev = "7e66a771287adbc86d3b6a27f7e0ffa36215f742";
    hash = "sha256-bbv2ByQP5OuA+n+oRmOIcPGhGkyLuUxmWyMj9G/CHs4=";
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
    homepage = "https://github.com/librepup";
    description = "Jonafonts Fonts Bundle";
    maintainers = [ maintainers.librepup ];
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
