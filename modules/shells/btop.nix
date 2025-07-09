{
  flake.modules.homeManager.base =
    { lib, pkgs, ... }:
    {
      programs.btop = {
        enable = true;
        package = lib.mkDefault pkgs.btop;
      };
    };
  flake.modules.homeManager.gui =
    { lib, pkgs, ... }:
    {
      programs.btop.package = lib.mkForce pkgs.btop-rocm;
    };
}
