{ inputs, ... }:
{
  flake.modules.nixos.pc = {
    imports = [
      inputs.disko.nixosModules.disko
    ];
  };
}
