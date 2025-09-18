{
  flake.modules.nixos.nginx-jellyfin = {
    services.nginx = {
      enable = true;
      clientMaxBodySize = "20M";
      virtualHosts."watch.bivsk.com" = {
        forceSSL = true;
        enableACME = true;

        # https://jellyfin.org/docs/general/post-install/networking/reverse-proxy/nginx/
        extraConfig = ''
          	  add_header X-Content-Type-Options "nosniff";
          	  add_header Content-Security-Policy "default-src https: data: blob: ; img-src 'self' https://* ; style-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' https://www.gstatic.com https://www.youtube.com blob:; worker-src 'self' blob:; connect-src 'self'; object-src 'none'; frame-ancestors 'self'; font-src 'self'";
          	'';

        locations."/" = {
          proxyPass = "http://10.0.0.2:8096";
          recommendedProxySettings = true;
          extraConfig = ''
            	    proxy_buffering off;
            	  '';
        };
        locations."/socket" = {
          proxyWebsockets = true;
        };
      };
    };
  };
}
