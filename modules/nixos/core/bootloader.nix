{
  flake.modules.nixos.grub =
    { lib, ... }:
    {
      boot.loader = {
        grub = {
          enable = true;
          device = lib.mkDefault "nodev";
          zfsSupport = true;
        };
      };
    };
}
