let
  portS3 = 8003;
  portWeb = 8004;
  portRpc = 8005;
in
{
  flake.modules.nixos.garage =
    {
      config,
      pkgs,
      ...
    }:
    {
      secrets.garageEnvironment.rekeyFile = ./environment.age;

      services.garage = {
        enable = true;
        package = pkgs.garage_2;

        environmentFile = config.secrets.garageEnvironment.path;

        settings = {
          data_dir = [
            {
              capacity = "512G";
              path = "/var/lib/garage/data";
            }
          ];

          replication_factor = 1;
          consistency_mode = "consistent";

          metadata_fsync = false;
          data_fsync = false;

          rpc_bind_addr = "0.0.0.0:${builtins.toString portRpc}";

          s3_api = {
            s3_region = "garage";

            api_bind_addr = "127.0.0.1:${builtins.toString portS3}";
            root_domain = "s3.bivsk.com";
          };

          s3_web = {
            bind_addr = "127.0.0.1:${builtins.toString portWeb}";
            root_domain = "cdn.bivsk.com";
          };
        };
      };
    };

  flake.modules.nixos.garage-nginx =
    { config, ... }:
    {
      services.nginx = {
        enable = true;
        recommendedProxySettings = true;
        virtualHosts."s3.bivsk.com" = {
          enableACME = true;
          forceSSL = true;
          extraConfig = ''
            	    client_max_body_size 5g;
            	  '';
          locations."/".proxyPass = "http://10.0.0.2:${builtins.toString portS3}";
        };
      };
    };
}
