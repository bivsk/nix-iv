{ lib, ... }:
let
  inherit (lib) attrValues;
in
{
  flake.modules.homeManager.gui =
    { pkgs, ... }:
    {
      home.packages =
        attrValues
        <| {
          inherit (pkgs)
            ani-cli
            yt-dlp
            ;
        };

      programs.mpv = {
        enable = true;
        defaultProfiles = [ "gpu-hq" ];
        scripts =
          attrValues
          <| {
            inherit (pkgs.mpvScripts)
              uosc
              mpris
              autoload
              ;
          };
      };
    };
}
