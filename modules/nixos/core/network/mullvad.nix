{
  flake.modules.nixos = {
    mullvad.services.mullvad-vpn.enable = true;
    # TODO: don't really need this at all on non-desktops
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
