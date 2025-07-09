{
  inputs,
  lib,
  ...
}:
{
  flake.modules = {
    nixos.pc = {
      imports = [ inputs.stylix.nixosModules.stylix ];
      stylix = {
        enable = true;
        homeManagerIntegration.autoImport = false;
      };
    };

    homeManager.base = {
      imports = [ inputs.stylix.homeModules.stylix ];
      stylix.enable = true;
    };
  };
}
