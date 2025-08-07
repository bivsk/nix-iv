{ config, ... }:
{
  flake.modules.nixos.ssh = {
    imports = with config.flake.modules.nixos; [
      sshd
    ];
  };
}
