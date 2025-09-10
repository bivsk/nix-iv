{
  flake.modules.nixos.fprintd = {
    services.fprintd.enable = true;

    environment.persistence."/persist".directories = [
      "/var/lib/fprint"
    ];

    # Disable fingerprint authentification for SDDM
    # If enabled, both password AND fingerprints are required
    security.pam.services.login.fprintAuth = false;
  };
}
