{
  flake.modules = {
    nixos.pc =
      { pkgs, ... }:
      {
        services.mullvad-vpn = {
          enable = true;
          package = pkgs.mullvad-vpn;
        };
      };
  };
}
