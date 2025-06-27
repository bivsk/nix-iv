{ config, ... }:
{
  flake.modules.nixos."nixosConfigurations/robin".imports = with config.flake.modules.nixos; [
    efi
    workstation
  ];
}
