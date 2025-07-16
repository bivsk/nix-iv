{ config, inputs, ... }:
{
  flake.modules.nixos.virtualization.imports = with config.flake.modules.nixos; [
    docker
    libvirt
  ];
}
