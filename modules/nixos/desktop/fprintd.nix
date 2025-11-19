{
  flake.modules.nixos.fprintd = {
    services.fprintd.enable = true;

    # Disable fingerprint authentification for SDDM
    # If enabled, both password AND fingerprints are required
    security.pam.services.login.fprintAuth = false;
  };
}
