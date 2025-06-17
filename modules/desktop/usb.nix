{
  config,
  lib,
  ...
}: let
  inherit (lib) enabled merge mkIf;
in
  merge
  <| mkIf config.isDesktop {
    services.udisks2.enable = true;
    home-manager.sharedModules = [
      {
        services.udiskie = enabled {
          tray = "auto"; # auto, always, never
        };
      }
    ];
  }
