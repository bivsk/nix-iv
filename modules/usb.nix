{ config, lib, ... }: let
  inherit (lib) enabled merge mkIf;
in merge <| mkIf config.isDesktop {
  services.udiskie = enabled {
    tray = "auto"; # auto, always, never
  };
}
