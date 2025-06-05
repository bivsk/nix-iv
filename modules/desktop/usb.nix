{ config, lib, ... }: let
  inherit (lib) enabled merge mkIf;
in merge <| mkIf config.isDesktop {
  home-manager.sharedModules = [{
    services.udiskie = enabled {
      tray = "auto"; # auto, always, never
    };
  }];
}
