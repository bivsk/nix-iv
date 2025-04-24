{
  appimageTools,
  fetchurl
}: let
  pname = "tari-universe";
  version = "0.9.850";
  src = fetchurl {
    url = "https://github.com/tari-project/universe/releases/download/v${version}/tari_universe_${version}_amd64.AppImage";
    sha256 = "sha256-v/vJajccZcDXqO7q/xBGOutx5f5gJxhO9WZCzUeoDz4=";
  };
  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in appimageTools.wrapType2 {
  inherit pname version src;
  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/tari_universe.desktop -t $out/share/applications
  '';
}
