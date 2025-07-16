{
  flake.modules.homeManager.signal =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.signal-desktop ];
    };
}
