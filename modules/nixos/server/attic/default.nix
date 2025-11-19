let
  port = 10220;
in
{
  flake.modules.nixos.atticd =
    {
      config,
      inputs,
      lib,
      ...
    }:
    {
      secrets.atticd-env.rekeyFile = ./environment.age;

      services.atticd = {
        enable = true;
        mode = "monolithic";

        environmentFile = config.secrets.atticd-env.path;

        settings = {
          listen = "[::]:${builtins.toString port}";
          api-endpoint = "https://cache.bivsk.com/";

          jwt = { };
        };
      };

      networking.firewall.allowedTCPPorts = [
        port
      ];
    };

  flake.modules.nixos.attic-nginx =
    { config, ... }:
    {
      services.nginx = {
        enable = true;
        recommendedProxySettings = true;
        virtualHosts."cache.bivsk.com" = {
          enableACME = true;
          forceSSL = true;
          locations."/".proxyPass = "http://10.0.0.2:${builtins.toString port}";
        };
      };
    };

  flake.modules.nixos.core =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.attic-client ];
    };
}
