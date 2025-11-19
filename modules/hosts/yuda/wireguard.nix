{
  flake.modules.nixos."nixosConfigurations/yuda" =
    { config, ... }:
    let
      port = 58440;
    in
    {
      networking.firewall.allowedUDPPorts = [ port ];
      networking.wireguard.interfaces = {
        wg-proxy = {
          ips = [ "10.0.0.3/24" ];
          listenPort = port;
          generatePrivateKeyFile = true;
          privateKeyFile = "/persist/etc/wireguard/wg-proxy";
          peers = [
            {
              publicKey = "HJgD4XfMYdOIE1EESXTMyLUe98AgyZJdXx9NzJsqqAY=";
              endpoint = "168.235.89.39:${builtins.toString port}";
              allowedIPs = [ "10.0.0.1/32" ];
              persistentKeepalive = 25; # Keep connection alive through NAT
            }
          ];
        };
      };
    };
}
