{ config, lib, ... }: let
  inherit (lib) enabled merge mkIf;
in merge <| mkIf config.isDesktop {
  services.geoclue2 = enabled {
    appConfig.gammastep = {
      isAllowed = true;
      isSystem = false;
    };
  };

  home-manager.sharedModules = [{
    services.gammastep = enabled {
      provider = "geoclue2";
      temperature.day = 5500;
      temperature.night = 1900;
    };
  }];
}
