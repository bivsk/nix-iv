{
  nixpkgs.allowedUnfreePackages = [ "trezor-suite" ];
  flake.modules.nixos.crypto =
    {
      pkgs,
      ...
    }:
    {
      hardware.ledger.enable = true;
      services.trezord.enable = true;

      home-manager.sharedModules = [
        {
          home.packages = [
            # wallets
            pkgs.ledger-live-desktop
            pkgs.monero-cli
            pkgs.trezor-suite
          ];
        }
      ];
    };
}
