{ inputs, ... }:
{
  flake.modules.nixos.desktop = {
    imports = [ inputs.stylix.nixosModules.stylix ];
    stylix.enable = true;
  };
}
