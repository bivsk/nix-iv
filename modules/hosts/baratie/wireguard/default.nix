{
  flake.modules.nixos."nixosConfigurations/baratie" =
    { config, ... }:
    let
      port = 58440;
    in
    {
      networking.firewall.allowedUDPPorts = [ port ];
      networking.wireguard.interfaces = {
        wg-proxy = {
          ips = [ "10.0.0.1/24" ];
          listenPort = port;
	  generatePrivateKeyFile = true;
          privateKeyFile = "/persist/etc/wireguard/wg-proxy";
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
