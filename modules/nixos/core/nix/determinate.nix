{ inputs, ... }:
{
  flake.modules.nixos.nix =
    { lib, pkgs, ... }:
    {
      imports = [ inputs.determinate.nixosModules.default ];

      nix.settings = {
        substituters = [ "https://install.determinate.systems" ];
        trusted-public-keys = [ "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM" ];
        lazy-trees = true;
      };

      # home-manager.sharedModules = [
      #   {
      #     nix.package = lib.mkForce inputs.nix.packages.${pkgs.stdenv.system}.default;
      #   }
      # ];
    };
}
