{
  flake.modules.nixos.desktop.services.udisks2.enable = true;
  flake.modules.homeManager.gui.services.udiskie = {
    enable = true;
    tray = "auto"; # auto, always, never
  };
}
