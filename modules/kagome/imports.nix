{ config, ... }:
{
  flake.modules.nixos."nixosConfigurations/kagome".imports = with config.flake.modules.nixos; [
    efi
    workstation
  ];
}
