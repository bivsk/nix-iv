{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) enabled merge mkIf;
in
merge
<| mkIf config.isDesktop {
  services.blueman = enabled;

  hardware.bluetooth = enabled {
    package = pkgs.bluez-experimental;
    powerOnBoot = true;
    settings.General.Experimental = true;
  };
}
