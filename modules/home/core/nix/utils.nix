{
  perSystem =
    { pkgs, ... }:
    {
      packages.system = pkgs.writeShellScriptBin "system" "nix-instantiate --eval --expr builtins.currentSystem --raw";
    };
  flake.modules.homeManager.nix =
    { lib, pkgs, ... }:
    {
      home.packages = lib.attrValues {
        inherit (pkgs)
          nix-output-monitor
          nix-fast-build
          nix-tree
          nvd
          nix-diff
          ;
      };
    };
}
