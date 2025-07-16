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
          geoclue2.appConfig = {
            # reduce network location accuracy
            networkAccuracy = 10000; # meters
            # ignore vpn
            ignoredNetworkInterfaces = [ "wg0-mullvad" ];
          };
        };
      };
  };
}
