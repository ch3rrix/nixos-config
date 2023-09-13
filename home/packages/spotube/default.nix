{ stdenv, lib
, fetchurl
, alsaLib
, openssl
, zlib
, pulseaudio
, autoPatchelfHook
}:

stdenv.mkDerivation rec {
  pname = "spotube";
  version = "3.1.1";

  src = fetchurl {
    url = "https://github.com/KRTirtho/spotube/releases/download/v${version}/spotube-linux-${version}-x86_64.tar.xz";
    sha256 = "";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    alsaLib
    openssl
    zlib
    pulseaudio
  ];

  sourceRoot = ".";

  installPhase = ''
    install -m755 -D studio-link-standalone-v${version} $out/bin/studio-link
  '';

  meta = with lib; {
    homepage = "https://spotube.krtirtho.dev/";
    description = "A fast, modern, lightweight & efficient Spotify Music Client for every platform";
    platforms = platforms.linux;
  };
}
