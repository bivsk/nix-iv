{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ledger-live-desktop
    trezor-suite
  ];
}
