{ lib, ... }:
{
  flake.modules.nixos.pc = {
    options.networking = {
      ipv4.address = lib.mkOption {
        default = null;
      };
      ipv4.prefixLength = lib.mkOption {
        default = 24;
      };
    };
  };
}
