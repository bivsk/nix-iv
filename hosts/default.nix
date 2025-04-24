{ self, inputs, ... }: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;

    mod = "${self}/system";
    inherit (import mod) desktop laptop;

    specialArgs = {inherit inputs self;};
  in {
    robin = nixosSystem {
      inherit specialArgs;
      modules = 
        desktop
	++ [
          ./robin

	  "${mod}/programs/gamemode.nix"
	  "${mod}/programs/games.nix"

	  "${mod}/services/location.nix"

	{
	  home-manager = {
	    users.four.imports = ["${self}/home"];
	    extraSpecialArgs = specialArgs;
	    backupFileExtension = ".hm-backup";
	  };
	}
      ];

    };
  };
}
