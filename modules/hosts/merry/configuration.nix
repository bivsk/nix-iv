{
  flake.modules.nixos."nixosConfigurations/merry" =
    { config, lib, ... }:
    {
      age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICeIagI3z8YmGt4FDC9KYK8KCRZPLFhIhuoUIbLGQFDE";

      networking.hostName = "merry";
      networking.ipv4.address = "192.168.0.29";

      services = {
        fprintd.enable = true; # fingerprint reader
        # TODO: move to all hosts
        logind.settings.Login.HandlePowerKey = "lock"; # default is "poweroff"
      };

      boot.loader.timeout = 0;

      # Disable fingerprint authentification for SDDM
      # If enabled, both password AND fingerprints are required
      security.pam.services.login.fprintAuth = false;

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };
    };
}
