let
  flake.modules.nixos.desktop = {
    hardware.ledger.enable = true;
    services.trezord.enable = true;
  };

  flake.modules.homeManager.gui =
    { lib, pkgs, ... }:
    {
      home.packages =
        lib.attrValues
        <| {
          inherit (pkgs)
            # wallets
            ledger-live-desktop
            monero-gui
            trezor-suite
            # trading
            tradingview
            ;
        };
    };
in
{
  inherit flake;
  nixpkgs.allowedUnfreePackages = [
    "tradingview"
    "trezor-suite"
  ];
}
