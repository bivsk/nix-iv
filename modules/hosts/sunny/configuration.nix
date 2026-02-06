{
  flake.modules.nixos."nixosConfigurations/sunny" =
    { config, ... }:
    {
      age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILZc4zzC1R7/OIKUBTSnjHQzFul/beoAcB4gWYXpWmxn";

      networking.hostName = "sunny";
      networking.ipv4.address = "192.168.0.22";

      boot.loader.timeout = 3;

      p2poolix = {
        enable = true;
        p2pool.chain = "mini";
        monero.address = "44MdFcbPopsTfSY5j89vVKFwGbgW61viq942yBgsspoKSdjtyoGbtkvWQAic4yft57DWbwo5sbcGc48ca17FXYdPDEMsLXg";
        monero.rpc.address = "192.168.0.22";
        monero.openFirewall = true;
        xmrig.settings = {
          cpu.priority = 1;
        };
      };

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };
    };
}
