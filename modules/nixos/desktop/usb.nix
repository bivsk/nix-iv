{
  flake.modules.nixos.desktop = {
    services.udisks2.enable = true;
    home-manager.sharedModules = [
      {
        services.udiskie = {
          enable = true;
          tray = "never";
        };
      }
    ];
  };
}
