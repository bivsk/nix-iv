{
  flake.modules.nixos."nixosConfigurations/sunny" =
    { config, ... }:
    {
      age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILZc4zzC1R7/OIKUBTSnjHQzFul/beoAcB4gWYXpWmxn";

      networking.hostName = "sunny";
      networking.ipv4.address = "192.168.0.22";

      boot.loader.timeout = 3;

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };
    };
}
