{
  flake.modules.nixos.mullvad =
    { pkgs, ... }:
    {
      services = {
        mullvad-vpn = {
          package = pkgs.mullvad-vpn; # gui + cli
        };
      };
    };
}
