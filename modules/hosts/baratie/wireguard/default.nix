{
  flake.modules.nixos."nixosConfigurations/baratie" =
    { config, ... }:
    let
      port = 58440;
    in
    {
      # TODO: maybe just generate a system key into /persist?
      secrets.wireguard-private-key.rekeyFile = ./private-key.age;

      networking.firewall.allowedUDPPorts = [ port ];

      networking.wireguard.interfaces = {
        wg0 = {
          ips = [ "10.0.0.1/24" ];
          listenPort = port;
          privateKeyFile = config.secrets.wireguard-private-key.path;
          # privateKeyFile = /persist/wg/private.key
	  # should /persist be portable between machines?
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
