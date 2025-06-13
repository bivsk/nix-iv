{
  appimageTools,
  fetchurl
}: let
  pname = "tari-universe";
  version = "1.2.9";
  src = fetchurl {
    url = "https://github.com/tari-project/universe/releases/download/v${version}/tari_universe_${version}_amd64.AppImage";
    sha256 = "sha256-VQ6qOz219YtLM+QgmXs0TGW0rRnHiZjd4b5ALtFaOV8=";
  };
  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in appimageTools.wrapType2 {
  inherit pname version src;
  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/tari_universe.desktop -t $out/share/applications
  '';
}
