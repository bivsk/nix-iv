{
  flake.modules.nixos.vaultwarden = {
    services.vaultwarden = {
      enable = true;
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
	  locations."/" = {
	    proxyPass = "http://10.0.0.3:8000";
	    proxyWebsockets = true;
	  };
	};
      };
    };
  };
}
