{ config, lib, ... }: let
  inherit (lib) enabled merge mkIf;
in merge <| mkIf config.isDesktop {
  hardware.graphics = enabled;

  services.xserver.displayManager.gdm = enabled;
  services.xserver.desktopManager.gnome = enabled;
}
