{
  flake.modules.nixos = {
    nixarr.nixarr.radarr = {
      enable = true;
      openFirewall = true;
    };

    nginx-radarr = {
      services.nginx = {
        enable = true;
        recommendedProxySettings = true;
        virtualHosts."radarr.bivsk.com" = {
          forceSSL = true;
          enableACME = true;

          extraConfig = ''
            	  proxy_set_header Referer $http_referer;
            	  proxy_set_header X-Real-Port $remote_port;
            	  proxy_set_header X-Forwarded-Ssl on;
            	'';

          locations."/" = {
            proxyPass = "http://10.0.0.2:7878";
          };
        };
      };
    };
  };
}
