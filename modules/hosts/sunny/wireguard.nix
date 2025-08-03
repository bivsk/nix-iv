{
  flake.modules.nixos."nixosConfigurations/sunny" =
    { config, ... }:
    let
      # TODO: add check to keep this in sync between machines
      # if one is updated, push updates to all clients
      port = 58440;
    in
    {
      secrets.wireguard-private-key.rekeyFile = ./private-key.age;

      # Configure wg interface
      networking.wireguard.interfaces = {
        wg-proxy = {
          ips = [ "10.0.0.2/24" ];
          listenPort = port;
          privateKeyFile = config.secrets.wireguard-private-key.path;
          peers = [
            {
              publicKey = "+pGiXNbccW/P9HNVQTj2sfoUs/aRGTlwsfr438xa7Vw=";
              allowedIPs = [ "10.0.0.1/32" ];
              endpoint = "168.235.89.39:${builtins.toString port}";
              persistentKeepalive = 25; # Keep connection alive through NAT
            }
          ];
        };
      };
    };
}
