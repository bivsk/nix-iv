{ lib, ... }:
let
  inherit (lib) attrValues;
in
{
  nixpkgs.allowedUnfreePackages = [
    "tradingview"
  ];

  flake.modules.homeManager.gui =
    { pkgs, ... }:
    {
      home.packages =
        attrValues
        <| {
          inherit (pkgs)
            tradingview
            ;
        };
    };
}
