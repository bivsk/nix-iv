{
  nixpkgs.allowedUnfreePackages = [ "tradingview" ];
  flake.modules.homeManager.tradingview = 
    { pkgs, ... }:
    {
      home.packages = [ pkgs.tradingview ];
    };
}
