{
  flake.modules.homeManager.anime =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.ani-cli
      ];
    };
}
