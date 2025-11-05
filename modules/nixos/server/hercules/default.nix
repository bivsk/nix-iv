{
  flake.modules.nixos.hercules-ci-agent =
    { config, inputs, ... }:
    let
      port = 10220;
    in
    {
      secrets.hercules-cluster-key.rekeyFile = ./cluster-token.age;
      secrets.hercules-cache-json.rekeyFile = ./caches-json.age;

      services.hercules-ci-agent = {
        enable = true;

        settings = {
	  binaryCachesPath = config.secrets.hercules-cache-json.path;
          clusterJoinTokenPath = config.secrets.hercules-cluster-key.path;
        };
      };

      environment.persistence."/persist".directories = [
        "/var/lib/hercules-ci-agent"
      ];
    };
}
