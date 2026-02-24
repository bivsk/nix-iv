{
  nixpkgs.allowedUnfreePackages = [ "claude-code" ];

  flake.modules.homeManager.code =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.claude-code
        pkgs.ghc
        pkgs.haskellPackages.cabal-install
      ];
    };
}
