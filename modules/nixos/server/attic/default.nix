{
  flake.modules.nixos.atticd =
    { config, inputs, ... }:
    let
      port = 10220;
    in
    {
      imports = [
        inputs.attic.nixosModules.atticd
      ];

      secrets.atticd-env.rekeyFile = ./environment.age;

      services.atticd = {
        enable = true;

        environmentFile = config.secrets.atticd-env.path;

        settings = {
          listen = "[::]:${builtins.toString port}";
          jwt = { };
        };
      };
    };
}
