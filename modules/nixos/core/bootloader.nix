{
  flake.modules.nixos.bootloader =
    { lib, ... }:
    {
      boot.loader = {
        grub = {
          enable = true;
          device = lib.mkDefault "nodev";
        };
      };
    };
}
