{ config, lib, ... }: let
  inherit (lib) enabled merge mkIf;
in merge <| config.isDesktop {
  hardware.brillo = enabled;
}
