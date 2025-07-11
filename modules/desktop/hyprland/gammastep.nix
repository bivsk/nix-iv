{
  flake.modules.nixos.desktop = {
    # TODO: only use this shit on laptops
    services.geoclue2 = {
      appConfig.gammastep = {
        isAllowed = true;
	isSystem = false;
      };
    };

    home-manager.sharedModules = [
      {
        services.gammastep = {
	  enable = true;
	  provider = "geoclue2";
	  temperature.day = 5500;
	  temperature.night = 1900;
	};
      }
    ];
  };
}
