{ lib, config, ... }:
{
  options.nix.gc = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.anything;
  };
  options.nix.optimise = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.anything;
  };
  options.nix.settings = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.anything;
  };
  config = {
    nix = {
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
      optimise.automatic = true;
      settings = {
        keep-outputs = true;
        experimental-features = [
          "nix-command"
          "flakes"
          "pipe-operators"
        ];
        trusted-users = [
          "root"
          config.flake.meta.owner.name
        ];
      };
    };

    flake.modules = {
      homeManager.base.nix = {
        inherit (config.nix) settings;
      };

      nixos.pc.nix = {
        inherit (config.nix) gc optimise settings;
      };
    };
  };
}
