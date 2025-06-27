{
  flake.modules.nixos.pc.hardware.ledger.enable = true;

  flake.modules.homeManager.gui =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.ledger-live-desktop
      ];
    };
}
