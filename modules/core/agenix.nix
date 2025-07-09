{ inputs, ... }:
{
  flake.modules.nixos.pc =
    { config, lib, ... }:
    {
      imports = [
	(lib.mkAliasOptionModule [ "secrets" ] [ "age" "secrets" ])
        inputs.agenix.nixosModules.default
        inputs.agenix-rekey.nixosModules.default
      ];

      age.identityPaths = [ "/root/.ssh/id" ];

      environment = {
        shellAliases.agenix = "agenix --identity ~/.ssh/id";
	systemPackages = [ pkgs.agenix ];
      };
    };
}
