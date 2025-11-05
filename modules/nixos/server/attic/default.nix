{
  flake.modules.nixos.atticd =
    { config, inputs, ... }:
    let
      port = 10220;
    in
    {
      secrets.atticd-env.rekeyFile = ./environment.age;

      services.atticd = {
        enable = true;
	mode = "monolithic";

        environmentFile = config.secrets.atticd-env.path;

        settings = {
          listen = "[::]:${builtins.toString port}";
          jwt = { };
        };
      };

      environment.persistence."/persist".directories = [
        "/var/lib/private/atticd"
      ];
    };

  flake.modules.nixos.core = 
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.attic-client ];
    };
}
