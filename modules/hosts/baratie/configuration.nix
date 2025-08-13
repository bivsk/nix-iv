{ inputs, ... }:
{
  nixosHosts.baratie = {
    unstable = true;
  };

  flake.modules.nixos."nixosConfigurations/baratie" = {
    age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFFYe9FVPVOQ3N3UtIZwuKaoSkZTIncRqkQoGfjL822+";

    imports = with inputs.self.modules.nixos; [
      grub
      impermanence

      # reverse proxies
      acme
      nginx-jellyfin
      nginx-jellyseerr
      nginx-sonarr
    ];

    # TODO: better manage ssh keys between hosts
    # should probably use a user-owned key to connect btw devices and leave system keys for agenix?
    users.users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPgHRgDdmenFi5SH02Rrja7iICXUAQQJqdQACPLY9S/1 four@robin"
    ];

    networking.hostName = "baratie";

    # TODO: move to nginx
    networking.firewall.allowedTCPPorts = [
      80
      443
    ];

    boot.loader.timeout = 0;

    system = {
      autoUpgrade.enable = false;
      stateVersion = "25.05";
    };

    # TODO: move to ssh nixos module
    services.openssh = {
      enable = true;
      hostKeys = [
        {
          path = "/persist/ssh/ssh_host_ed25519_key";
          type = "ed25519";
        }
        {
          path = "/persist/ssh/ssh_host_rsa_key";
          type = "rsa";
          bits = 4096;
        }
      ];
    };
  };
}
