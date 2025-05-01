{
  appimageTools,
  fetchurl
}: let
  pname = "tari-universe";
  version = "0.9.913";
  src = fetchurl {
    url = "https://github.com/tari-project/universe/releases/download/v${version}/tari_universe_${version}_amd64.AppImage";
    sha256 = "sha256-4f/oW12qHmNQII+MxNTGgy2JL2biNStp5diNbvVJ7q0=";
  };
  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in appimageTools.wrapType2 {
  inherit pname version src;
  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/tari_universe.desktop -t $out/share/applications
  '';
}
