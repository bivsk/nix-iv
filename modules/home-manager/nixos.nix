{
  inputs,
  config,
  ...
}:
{
  flake.modules.nixos.pc = 
    let
      inherit (config.networking) hostName;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      home-manager = {
        useGlobalPkgs = true;
        extraSpecialArgs.hasGlobalPkgs = true;
        # https://github.com/nix-community/home-manager/issues/6770
        #useUserPackages = true;
        backupFileExtension = "bak";

        users.${config.flake.meta.owner.name}.imports = [
          (
            { osConfig, ... }:
            {
              home.stateVersion = osConfig.system.stateVersion;
            }
          )
          config.flake.modules.homeManager.base
          config.flake.modules.homeManager.gui
	  (config.flake.modules.homeManager."homeConfigurations/kagome" or { })
        ];
      };
    };
}
