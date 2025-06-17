{
  config,
  lib,
  ...
}:
let
  inherit (lib) enabled merge mkIf;
in
merge
<| mkIf config.isLaptop {
  hardware.brillo = enabled;
}
