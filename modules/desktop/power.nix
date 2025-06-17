{
  config,
  lib,
  ...
}: let
  inherit (lib) enabled merge mkIf;
in
  merge
  <| mkIf config.isDesktop {
    powerManagement = enabled;
    services.power-profiles-daemon = enabled;
    services.upower = enabled;
  }
