{
  flake.modules.homeManager.gui =
    { lib, pkgs, ... }:
    {
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
}
