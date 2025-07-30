{
  flake.modules.nixos."nixosConfigurations/sunny" =
    { config, ... }:
    {
      secrets.wireguard-private-key.rekeyFile = ./private-key.age;

      # Configure wg interface
      networking.wireguard.interfaces = {
        wg0 = {
          ips = [ "10.0.0.2/24" ];
          listenPort = 51820;
          privateKeyFile = config.secrets.wireguard-private-key.path;
          peers = [
            {
              publicKey = "+pGiXNbccW/P9HNVQTj2sfoUs/aRGTlwsfr438xa7Vw=";
              allowedIPs = [ "10.0.0.1/32" ];
              endpoint = "168.235.89.39:51820";
              persistentKeepalive = 25; # Keep connection alive through NAT
            }
          ];
        };
      };
    };
}
