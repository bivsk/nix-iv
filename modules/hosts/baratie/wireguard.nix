{
  flake.modules.nixos."nixosConfigurations/baratie" =
    { config, ... }:
    {
      secrets.wireguard-private-key.rekeyFile = ./private-key.age;

      # Open wireguard port in firewall
      networking.firewall.allowedUDPPorts = [ 51820 ];

      # Configure wg interface
      networking.wireguard.interfaces = {
        wg0 = {
          ips = [ "10.0.0.1/24" ];
          listenPort = 51820;
          privateKeyFile = config.secrets.wireguard-private-key.path;
          peers = [
            {
              publicKey = "mY78JydE1dLOiTG6fIxeS0lckU/uAJ/WN4d8Q0aBeDI=";
              allowedIPs = [ "10.0.0.2/32" ];
            }
          ];
        };
      };
    };
}
