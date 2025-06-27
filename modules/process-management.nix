{ lib, ... }:
let
  inherit (lib) attrValues;
in
{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages =
        attrValues
        <| {
          inherit (pkgs)
            lsof
            procs
            psmisc
            watchexec
            ;
        };

      programs.bottom = {
        enable = true;
        settings = {
          rate = 400;
        };
      };
    };
}
