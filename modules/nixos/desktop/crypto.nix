{
  nixpkgs.allowedUnfreePackages = [ "trezor-suite" ];
  flake.modules.nixos.crypto =
    {
      inputs,
      lib,
      pkgs,
      ...
    }:
    {
      hardware.ledger.enable = true;
      services.trezord.enable = true;

      imports = [
        inputs.p2pool-nix.nixosModules.default
      ];

      home-manager.sharedModules = [
        {
          home.packages = [
            # wallets
            pkgs.ledger-live-desktop
            pkgs.monero-gui
            pkgs.trezor-suite

            # tari suite
            inputs.p2pool-nix.packages.${pkgs.system}.tari
          ];
        }
      ];
    };
}
