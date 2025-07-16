{
  flake.modules.homeManager.telegram =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.telegram-desktop ];
    };
}
