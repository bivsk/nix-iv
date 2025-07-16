{ config, ... }:
{
  flake.modules.homeManager."homeConfigurations/sunny" = {
    imports = with config.flake.modules.homeManager; [
      desktop
    ];
  };
}
