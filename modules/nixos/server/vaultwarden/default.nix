let
  vaultHost = "vault.bivsk.com";
  wgIp = "10.0.0.3";
  port = 8222;
in
{
  flake.modules.nixos.vaultwarden = 
    { config, pkgs, ... }:
    {
      networking.firewall.allowedTCPPorts = [ port ];

      secrets.vaultEnvironment = {
        rekeyFile = ./environment.age;
	owner = "vaultwarden";
	group = "vaultwarden";
      };

      services.vaultwarden = {
        enable = true;
	backupDir = "/vault";
	config = {
	  DOMAIN = "https://${vaultHost}";
	  ROCKET_ADDRESS = wgIp;
	  ROCKET_PORT = port;
	  SIGNUPS_ALLOWED = false;
	};
        environmentFile = config.secrets.vaultEnvironment.path;
      };

      environment.persistence."/persist".directories = [
        "/var/lib/vaultwarden"
      ];

      # vaultwarden cli
      environment.systemPackages = [
        pkgs.vaultwarden
      ];
    };

  flake.modules.nixos.vaultwarden-nginx = {
    services.nginx = {
      enable = true;

      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;

      virtualHosts."${vaultHost}" = {
        enableACME = true;
        forceSSL = true;
        extraConfig = ''
            proxy_connect_timeout       777;
            proxy_send_timeout          777;
            proxy_read_timeout          777;
            send_timeout                777;
        '';
        locations."/" = {
          proxyPass = "http://${wgIp}:${builtins.toString port}";
          proxyWebsockets = true;
        };
      };
    };
  };
}
