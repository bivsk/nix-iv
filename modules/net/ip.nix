{ lib, ... }: let
  inherit (lib) mkValue;
in {
  options.networking = {
    ipv4.address = mkValue null;
    ipv4.prefixLength = mkValue 24;
  };
}
