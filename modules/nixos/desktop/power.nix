{
  flake.modules.nixos.power-management = {
    powerManagement.enable = true;
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
  };
}
