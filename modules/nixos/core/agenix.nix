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

      environment.systemPackages = [ pkgs.rage ];

      age.rekey = {
        storageMode = "local";
        masterIdentities = [ ../../../.secrets/age-yubikey-identity.pub ];
        localStorageDir = ../../../.secrets/${config.networking.hostName};
      };
    };
}
