{ lib, ... }:
{
  flake.modules.nixos."nixosConfigurations/sunny" =
    { config, ... }:
    {
      age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDG/u5Gu1JiCGK3NPAPNX9oMIxA6bHe4Fc3W0drS/rOj";

      networking.hostName = "sunny";
      networking.ipv4.address = "192.168.0.22";

      boot.loader.timeout = 3;

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };
    };
}
