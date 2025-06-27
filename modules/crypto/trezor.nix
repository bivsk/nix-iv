{
  nixpkgs.allowedUnfreePackages = [ "trezor-suite" ];

  flake.modules.nixos.pc.services.trezord.enable = true;

  flake.modules.homeManager.gui =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.trezor-suite
      ];
    };
}
