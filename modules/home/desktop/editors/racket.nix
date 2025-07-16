{
  flake.modules.homeManager.racket = 
    { pkgs, ... }:
    {
      home.packages = [ pkgs.racket ];
    };
}
