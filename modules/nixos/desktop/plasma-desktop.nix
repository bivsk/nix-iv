{
  flake.modules.nixos.plasma-desktop = {
    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
