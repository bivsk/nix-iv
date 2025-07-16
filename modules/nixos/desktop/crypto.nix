{
  nixpkgs.allowedUnfreePackages = [ "trezor-suite" ];
  flake.modules.nixos.crypto =
    { lib, pkgs, ... }:
    {
      hardware.ledger.enable = true;
      services.trezord.enable = true;
      home-manager.sharedModules = [
        {
          home.packages =
            lib.attrValues
            <| {
              inherit (pkgs)
                # wallets
                ledger-live-desktop
                monero-gui
                trezor-suite
                ;
            };
        }
      ];
    };
}
