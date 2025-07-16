{
  flake.modules.nixos.core =
    { lib, ... }:
    {
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
