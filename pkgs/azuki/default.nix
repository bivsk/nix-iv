{ lib
, stdenvNoCC
, fetchzip
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "azuki";
  version = "1.21";

  src = fetchzip {
    url = "http://azukifont.com/font/azukifont121.zip";
    sha256 = "sha256-AMpEJDD8lN0qWJ5C0y4V+/2JE/pKQrUHGfKHcnV+dhA=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    pushd azukifont121/
    install -Dm644 *.ttf -t $out/share/fonts/truetype/
    popd
    runHook postInstall
  '';

  meta = with lib; {
    description = "A cute handwritten font";
    homepage = "http://azukifont.com/font/azuki.html";
    changelog = "http://azukifont.com/font/azuki.html";
    platforms = platforms.all;
  };
})
