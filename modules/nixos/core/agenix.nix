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
        inputs.agenix-rekey.nixosModules.default
      ];

      age.rekey = {
        storageMode = "local";
        masterIdentities = [ ../../../.secrets/age-yubikey-identity.txt ];
        localStorageDir = ../../../.secrets/${config.networking.hostName};
      };
    };
}
