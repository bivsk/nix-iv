{
  flake.modules.nixos."nixosConfigurations/merry" = {
    age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEstEZaTKSsV/eWPeum0KOR4tIrv9KOnrMsuNlPKBHtJ";

    networking.hostName = "merry";
    networking.ipv4.address = "192.168.0.29";

    services = {
      # TODO: move to all hosts
      logind.settings.Login.HandlePowerKey = "lock"; # default is "poweroff"
    };

    boot.loader.timeout = 0;

    system = {
      autoUpgrade.enable = false;
      stateVersion = "25.05";
    };
  };
}
