{ lib, ... }:
{
  flake.modules.nixos."nixosConfigurations/sunny" =
    { config, ... }:
    {
      age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID3TPAW2IIo4vwnSyoxEUrYM2SN44hXyIOdn2q0fdDW0";

      networking.hostName = "sunny";
      networking.ipv4.address = "192.168.0.22";

      boot.loader.timeout = 3;

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };
    };
}
