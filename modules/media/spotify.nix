{
  flake.modules.homeManager.gui =
    { lib, pkgs, ... }:
    {
      home.packages = lib.attrValues {
        inherit (pkgs)
          # streaming
          ani-cli
          spotify
          ;
      };

      programs.mpv = {
        enable = true;
        defaultProfiles = [ "gpu-hq" ];
        scripts = lib.attrValues {
          inherit (pkgs.mpvScripts)
            uosc
            mpris
            autoload
            ;
        };
      };
    };

  nixpkgs.allowedUnfreePackages = [
    "spotify"
  ];
}
