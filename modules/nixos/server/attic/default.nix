{
  flake.modules.nixos.atticd =
    { config, inputs, lib, ... }:
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

      # system.activationScripts."createPersistentStorageDirs".deps = [
      #   "var-lib-private-permissions"
      #   "users"
      #   "groups"
      # ];
      # system.activationScripts = {
      #   "var-lib-private-permissions" = {
      #     deps = [ "specialfs" ];
      #     text = ''
      #       mkdir -p /persist/var/lib/private
      #       chmod 0700 /persist/var/lib/private
      #     '';
      #   };
      # };
	     environment.persistence."/persist".directories = [
	       {
	         directory = "/var/lib/private";
	         mode = "0700";
	       }
	  #      {
	  #        directory = "/var/lib/private/atticd";
	  # user = config.services.atticd.user;
	  # group = config.services.atticd.group;
	  #        mode = "0700";
	  #      }
	     ];
    };

  flake.modules.nixos.core =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.attic-client ];
    };
}
