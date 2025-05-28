{ config, lib, pkgs, ... }: let
  inherit (lib) attrValues enabled merge mkIf;
in merge <| mkIf config.isDesktop {
  # wallets
  services.trezord = enabled;
  hardware.ledger = enabled;

  home-manager.sharedModules = [{
    home.packages = attrValues {
      inherit (pkgs)
        # wallets
        ledger-live-desktop
        trezor-suite

        # trading
        tradingview
      ;
    };
  }];
}
