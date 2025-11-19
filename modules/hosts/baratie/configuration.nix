{ inputs, ... }:
{
  nixosHosts.baratie = {
    unstable = true;
  };

  flake.modules.nixos."nixosConfigurations/baratie" = {
    age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMiOkmYkDX5XPu4j4SUDLj0Vke28FfQ31gzCq7+6UcFK";

    imports = with inputs.self.modules.nixos; [
      grub

      # reverse proxies
      acme
      attic-nginx
      garage-nginx
      nginx-jellyfin
      nginx-jellyseerr
      nginx-sonarr
      vaultwarden-nginx
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
  };
}
