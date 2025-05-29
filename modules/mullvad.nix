{ config, lib, pkgs, ... }: let
  inherit (lib) enabled;
in {
  services.mullvad-vpn = enabled {
    package = if config.isServer then
      pkgs.mullvad # cli
    else
      pkgs.mullvad-vpn; # cli + gui
  };
}
