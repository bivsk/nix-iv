{
  flake.modules.nixos.desktop = {
    # gui
    programs.seahorse.enable = true;

    # GNOME keyring
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.login.enableGnomeKeyring = true;
  };
}
