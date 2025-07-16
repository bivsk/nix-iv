topLevel@{ inputs, ... }:
{
  flake.modules.nixos.home-manager =
    { config, ... }:
    let
      inherit (config.networking) hostName;
    in
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        backupFileExtension = "bak";

        useGlobalPkgs = true;
        useUserPackages = true;

        users.four.imports = [
          topLevel.config.flake.modules.homeManager.core
          (topLevel.config.flake.modules.homeManager."homeConfigurations/${hostName}" or { })
        ];

        extraSpecialArgs.inputs = inputs;
      };
    };
}
