{
  flake.modules.homeManager.haskell =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.ghc
        pkgs.cabal-install
      ];
    };
}
