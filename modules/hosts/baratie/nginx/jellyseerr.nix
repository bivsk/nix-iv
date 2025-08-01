{
  flake.modules.nixos.nginx-jellyseerr = {
    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      virtualHosts."jellyseer.bivsk.com" = {
        forceSSL = true;
        enableACME = true;

        extraConfig = ''
          	  proxy_set_header Referer $http_referer;
          	  proxy_set_header X-Real-Port $remote_port;
          	  proxy_set_header X-Forwarded-Ssl on;
          	'';

        locations."/" = {
          proxyPass = "http://10.0.0.2:5055";
        };
      };
    };
  };
}
