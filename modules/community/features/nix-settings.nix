{
  flake.modules.nixos.nix-settings =
    { pkgs, config, ... }:
    {
      nix = {
        settings = {
          substituters = [
            "https://devenv.cachix.org"
          ];
          trusted-public-keys = [
            "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
          ];

          auto-optimise-store = true;
          experimental-features = [
	    # TODO: dix enables this by default
            "nix-command"
            "flakes"
            "pipe-operators"
          ];
          trusted-users = [
            "root"
            "four"
            "@wheel"
          ];
        };
        gc = pkgs.lib.optionalAttrs config.nix.enable {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 7d";
        };
      };
    };
}
