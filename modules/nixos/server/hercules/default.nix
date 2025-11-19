{
  flake.modules.nixos.hercules-ci-agent =
    { config, inputs, ... }:
    {
      secrets.hercules-cluster-key = {
        rekeyFile = ./cluster-token.age;
        owner = "hercules-ci-agent";
        group = "hercules-ci-agent";
      };
      secrets.hercules-cache-json = {
        rekeyFile = ./caches-json.age;
        owner = "hercules-ci-agent";
        group = "hercules-ci-agent";
      };

      services.hercules-ci-agent = {
        enable = true;

        settings = {
          binaryCachesPath = config.secrets.hercules-cache-json.path;
          clusterJoinTokenPath = config.secrets.hercules-cluster-key.path;
        };
      };
    };
}
