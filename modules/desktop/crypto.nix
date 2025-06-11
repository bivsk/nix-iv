{ config, lib, pkgs, self, ... }: let
  inherit (lib) attrValues enabled merge mkIf;
in merge <| mkIf config.isDesktop {
  # wallets
  services.trezord = enabled;
  hardware.ledger = enabled;

  home-manager.sharedModules = [{
    home.packages = attrValues <| {
      inherit (pkgs)
        # wallets
        ledger-live-desktop
        monero-gui
        trezor-suite

        # trading
        tradingview
      ;
      tari-universe = self.packages.x86_64-linux.tari-universe;
    };
  }];
}
