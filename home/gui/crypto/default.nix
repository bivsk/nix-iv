{ pkgs, self, ... }: {
  home.packages = with pkgs; [
    # wallets
    ledger-live-desktop
    trezor-suite
    self.packages.${pkgs.system}.tari-universe

    # trading
    tradingview
  ];
}
