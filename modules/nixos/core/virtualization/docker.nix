{ config, ... }:
{
  flake.modules.nixos.docker = {
    virtualisation.docker = {
      enable = true;
      enableOnBoot = false;
    };
    users.extraGroups.docker.members = [ "four" ];
  };
}
