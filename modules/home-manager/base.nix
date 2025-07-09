{ config, ... }:
{
  flake.modules.homeManager.base = args: {
    home = {
      username = config.flake.meta.owner.name;
      homeDirectory = "/home/${config.flake.meta.owner.name}";
    };
    programs.home-manager.enable = true;
    systemd.user.startServices = "sd-switch";
  };
}
