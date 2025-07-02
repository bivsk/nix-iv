{ inputs, lib, ... }:
let
  inherit (inputs.self.lib.mk-os)
    linux
    ;

  flake.nixosConfigurations = {
    kagome = linux "kagome";
    robin = linux "robin";
  };
in
{
  inherit flake;
}
