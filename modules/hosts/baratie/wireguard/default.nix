{
  flake.modules.nixos."nixosConfigurations/baratie" =
    { config, ... }:
    let
      port = 58440;
    in
    {
      secrets.wireguard-private-key.rekeyFile = ./private-key.age;

      # Open wireguard port in firewall
      networking.firewall.allowedUDPPorts = [ port ];

      # Configure wg interface
      networking.wireguard.interfaces = {
        wg0 = {
          ips = [ "10.0.0.1/24" ];
          listenPort = port;
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
