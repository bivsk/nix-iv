{
  flake.modules.nixos.vaultwarden = 
    { config, ... }:
    {
      secrets.vaultEnvironment.rekeyFile = ./environment.age;
      services.vaultwarden = {
        enable = true;
        environmentFile = config.secrets.vaultEnvironment.path;
      };
    };

  flake.modules.nixos.vaultwarden-nginx = {
    services.nginx = {
      enable = true;

      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;

      virtualHosts = {
        "vault.bivsk.com" = {
          enableACME = true;
          forceSSL = true;
          extraConfig = ''
            	      proxy_connect_timeout       777;
              proxy_send_timeout          777;
              proxy_read_timeout          777;
              send_timeout                777;
            	  '';
          locations."/" = {
            proxyPass = "http://10.0.0.3:8000";
            proxyWebsockets = true;
          };
        };
      };
    };
  };
}
