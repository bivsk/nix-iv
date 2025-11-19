{
  flake.modules.nixos.mullvad =
    { pkgs, ... }:
    {
      services = {
        mullvad-vpn = {
          enable = true;
          package = pkgs.mullvad-vpn; # gui + cli
        };
      };
    };
}
