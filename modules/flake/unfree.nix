{ lib, config, ... }:
{
  options.nixpkgs.allowedUnfreePackages = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
  };

  config = {
    flake = {
      modules =
        let
          predicate = pkg: builtins.elem (lib.getName pkg) config.nixpkgs.allowedUnfreePackages;
        in
        {
          nixos.core.nixpkgs.config.allowUnfreePredicate = predicate;

          # homeManager.core = args: {
          #   nixpkgs.config = lib.mkIf (!(args.hasGlobalPkgs or false)) {
          #     allowUnfreePredicate = predicate;
          #   };
          # };
        };

      unfree = config.nixpkgs.allowedUnfreePackages;
    };
  };
}
