{
  flake.modules.nixos.bootloader =
    { pkgs, ... }:
    {
      boot.loader = {
        grub = {
          enable = true;
          device = "nodev";
        };
      };
    };
}
