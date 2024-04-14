{ pkgs, lib, stdenvNoCC, fetchurl, p7zip }:

stdenvNoCC.mkDerivation rec {
  pname = "apple-fonts";
  version = "1.0.0";

  pro = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
    sha256 = "sha256-Mu0pmx3OWiKBmMEYLNg+u2MxFERK07BQGe3WAhEec5Q=";
  };

  compact = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg";
    sha256 = "sha256-Mkf+GK4iuUhZdUdzMW0VUOmXcXcISejhMeZVm0uaRwY=";
  };

  mono = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
    sha256 = "sha256-tZHV6g427zqYzrNf3wCwiCh5Vjo8PAai9uEvayYPsjM=";
  };

  ny = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/NY.dmg";
    sha256 = "sha256-tn1QLCSjgo5q4PwE/we80pJavr3nHVgFWrZ8cp29qBk=";
  };

  nativeBuildInputs = [ p7zip pkgs.parallel (pkgs.callPackage ./nerd-font-patcher.nix {}) ];

  sourceRoot = ".";

  unpackPhase = ''
    runHook preUnpack

    mkdir -p fonts

    7z x ${pro}
    cd SFProFonts
    7z x 'SF Pro Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* ../fonts/
    cd ..

    7z x ${mono}
    cd SFMonoFonts
    7z x 'SF Mono Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* ../fonts/
    cd ..

    runHook postUnpack
  '';

  buildPhase = ''
    runHook preBuild
    
    mkdir -p build
    find fonts -name \*.ttf -o -name \*.otf -print0 | parallel -j $NIX_BUILD_CORES -0 nerd-font-patcher -c --outputdir build {}

    runHook postBuild
  '';

  installPhase = ''
    mkdir -p $out/usr/share/fonts/OTF $out/usr/share/fonts/TTF
    mv build/*.otf $out/usr/share/fonts/OTF
  '';

  meta = {
    description = "Apple San Francisco, New York fonts";
    homepage = "https://developer.apple.com/fonts/";
    license = lib.licenses.unfree;
  };
}
