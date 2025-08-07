{ config, inputs, ... }:
{
  flake.modules.nixos.core = with config.flake.modules.nixos; [
    inputs.disko.nixosModules.disko

    agenix
    bootloader
    network
    nix
    security
    users
  ];
}
