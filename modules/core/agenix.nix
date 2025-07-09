{ inputs, ... }:
{
  flake.modules.nixos.pc =
    { lib, pkgs, ... }:
    {
      imports = [
	(lib.mkAliasOptionModule [ "secrets" ] [ "age" "secrets" ])
        inputs.agenix.nixosModules.default
        # inputs.agenix-rekey.nixosModules.default
      ];

      age.identityPaths = [ "/root/.ssh/id" ];

      environment = {
        shellAliases.agenix = "agenix --identity ~/.ssh/id";
	systemPackages = [ inputs.agenix.packages.${pkgs.system}.default ];
      };
    };
}
