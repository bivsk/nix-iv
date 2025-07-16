{
  flake.modules.nixos.keyring = {
    # gui
    programs.seahorse.enable = true;

    # GNOME keyring
    services.gnome.gnome-keyring.enable = true;
    services.gnome.gcr-ssh-agent.enable = false;
    security.pam.services.login.enableGnomeKeyring = true;

    home-manager.sharedModules = [
      {
        # allows auto-unlocking of the gnome keyring at login
        services.gnome-keyring.enable = true;
        home.sessionVariables.SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/keyring/ssh";
      }
    ];
  };
}
