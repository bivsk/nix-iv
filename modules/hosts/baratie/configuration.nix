{
  flake.modules.nixos."nixosConfigurations/baratie" =
    { lib, ... }:
    {
      age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMzZPBGLeDXX6cDhFV0v6ZbzhVrxEKN8Fmsna6Xl7Lu6";

      users.users.root.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPgHRgDdmenFi5SH02Rrja7iICXUAQQJqdQACPLY9S/1 four@robin"
      ];

      networking.hostName = "baratie";

      networking.firewall.allowedTCPPorts = [
        80
        443
      ];

      boot.loader.timeout = 0;

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };
    };
}
