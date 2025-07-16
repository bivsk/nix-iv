{
  flake.modules.homeManager.core =
    { lib, pkgs, ... }:
    {
      programs.btop = {
        enable = true;
        package = lib.mkDefault pkgs.btop;
      };
    };
  flake.modules.homeManager.desktop =
    { lib, pkgs, ... }:
    {
      programs.btop.package = lib.mkForce pkgs.btop-rocm;
    };
}
