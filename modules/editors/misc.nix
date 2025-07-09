{
  flake.modules.homeManager.gui =
    { lib, pkgs, ... }:
    {
      home.packages = lib.attrValues {
        inherit (pkgs)
          iverilog
          racket
          ;
      };
    };
}
