{ inputs, ... }:
{
  flake.modules.nixos.agenix =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      imports = [
        (lib.mkAliasOptionModule [ "secrets" ] [ "age" "secrets" ])
        inputs.agenix.nixosModules.default
        # inputs.agenix-rekey.nixosModules.default
      ];

      age.identityPaths = [ "/root/.ssh/id" ];

      environment = {
        shellAliases.agenix = "agenix --identity ~/.ssh/id";
        systemPackages = [ pkgs.agenix-cli ];
      };

      # age.rekey = {
      #   storageMode = "local";
      #   masterIdentities = [ ../../../.secrets/identity.age ];
      #   localStorageDir = ../../../.secrets/${config.networking.hostName};
      # };
    };
}
