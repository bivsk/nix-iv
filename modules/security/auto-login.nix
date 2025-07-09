{ config, ... }:
{
  flake.modules.nixos.desktop.services.getty = {
    autologinOnce = true;
    autologinUser = config.flake.meta.owner.name;
  };
}
