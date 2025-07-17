{ lib, ... }:
{
  flake.modules.nixos."nixosConfigurations/merry" = 
    { config, ... }:
    {
      secrets.id.rekeyFile = ./id.age;
      services.openssh.hostKeys = [{
        type = "ed25519";
        path = config.secrets.id.path;
      }];

      networking.hostName = "merry";
      networking.ipv4.address = "192.168.0.29";

      services = {
        fprintd.enable = true; # fingerprint reader

        logind.powerKey = "lock"; # default is "poweroff"
      };

      boot.loader.timeout = 0;

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };
    };
}
