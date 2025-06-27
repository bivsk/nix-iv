{ config, ... }:
{
  flake.modules.nixos.pc = {
    security.sudo-rs.enable = true;
    users.users.${config.flake.meta.owner.name}.extraGroups = [ "wheel" ];
  };
}
