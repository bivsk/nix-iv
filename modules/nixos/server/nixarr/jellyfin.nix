{
  flake.modules.nixos = 
    {
    nixarr = 
      { inputs, pkgs, ... }:
      {
      nixarr = {
        jellyfin = {
          enable = true;
	  # package = inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.jellyfin;
          openFirewall = true;
        };
        jellyseerr = {
          enable = true;
          openFirewall = true;
        };
      };
    };

    nginx-jellyfin = {
      services.nginx = {
        enable = true;
        clientMaxBodySize = "20M";
        recommendedProxySettings = true;
        virtualHosts."watch.bivsk.com" = {
          forceSSL = true;
          enableACME = true;

          # https://jellyfin.org/docs/general/post-install/networking/reverse-proxy/nginx/
          # extraConfig = ''
          #   	  add_header X-Content-Type-Options "nosniff";
          #   	  add_header Content-Security-Policy "default-src https: data: blob: ; img-src 'self' https://* ; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' https://www.gstatic.com https://www.youtube.com blob:; worker-src 'self' blob:; connect-src 'self'; object-src 'none'; frame-ancestors 'self'; font-src 'self'";
          #   	'';

          locations."/" = {
            proxyPass = "http://10.0.0.2:8096";
            extraConfig = ''
              	    proxy_buffering off;
              	  '';
          };
          locations."/socket" = {
            proxyPass = "http://10.0.0.2:8096";
            proxyWebsockets = true;
          };
        };
      };
    };

    nginx-jellyseerr = {
      services.nginx = {
        enable = true;
        recommendedProxySettings = true;
        virtualHosts."jellyseerr.bivsk.com" = {
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
  };
}
