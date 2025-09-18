{
  flake.modules.nixos."nixosConfigurations/sunny" =
    { config, ... }:
    {
      age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAbSst9DGpCA4JFO+ftqtaTzxtULSkFi+fbXj/eoa3b/";

      networking.hostName = "sunny";
      networking.ipv4.address = "192.168.0.22";

      boot.loader.timeout = 3;

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };
    };
}
