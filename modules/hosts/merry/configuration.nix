{
  flake.modules.nixos."nixosConfigurations/merry" =
  { config, lib, ... }:
  {
    age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILFKAmAX5DPob+pdMIW3PtyN26Sdfua2IoHGJO+QixMu";

    networking.hostName = "merry";
    networking.ipv4.address = "192.168.0.29";

    services = {
      fprintd.enable = true; # fingerprint reader

      logind.powerKey = "lock"; # default is "poweroff"
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
