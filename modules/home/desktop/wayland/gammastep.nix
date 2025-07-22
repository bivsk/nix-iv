{
  flake.modules.homeManager.wayland = {
    services.gammastep = {
      enable = true;
      provider = "manual";
      dawnTime = "6:30-7:45";
      duskTime = "19:45-21:00";
      temperature.day = 5500;
      temperature.night = 1900;
    };
  }
}
