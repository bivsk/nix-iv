{
  flake.modules.nixos = {
    core.services.mullvad-vpn.enable = true;
    desktop =
      { lib, pkgs, ... }:
      {
        services = {
          mullvad-vpn = {
            package = lib.mkForce pkgs.mullvad-vpn; # gui
          };
        };
      };
  };
}
