{ lib
, stdenvNoCC
, fetchzip
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "uzura";
  version = "1.00";

  src = fetchzip {
    url = "http://azukifont.com/font/uzurafont100.zip";
    sha256 = "sha256-LWsK8dviTylgj/suv4YCagJhMn5IMJw0un6w5yvgL68=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    pushd uzurafont100/
    install -Dm644 *.ttf -t $out/share/fonts/truetype/
    popd
    runHook postInstall
  '';

  meta = with lib; {
    description = "A cute handwritten font";
    homepage = "http://azukifont.com/font/uzura.html";
    changelog = "http://azukifont.com/font/uzura.html";
    platforms = platforms.all;
  };
})
