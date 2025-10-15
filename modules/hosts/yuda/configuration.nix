{ inputs, ... }:
{
  nixosHosts.yuda = {
    unstable = false;
  };

  flake.modules.nixos."nixosConfigurations/yuda" = {
    age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILNxpKYICqj5J6Lp4aBvrhvfG678+r/GBSfguu8fz2Pc";

    imports = with inputs.self.modules.nixos; [
      grub
      impermanence
      vaultwarden
    ];

    # TODO: better manage ssh keys between hosts
    # should probably use a user-owned key to connect btw devices and leave system keys for agenix?
    users.users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPgHRgDdmenFi5SH02Rrja7iICXUAQQJqdQACPLY9S/1 four@robin"
    ];

    networking.hostName = "yuda";
    networking.ipv4.address = "192.168.0.14";

    boot.loader.timeout = 0;

    system = {
      autoUpgrade.enable = false;
      stateVersion = "25.05";
    };
  };
}
