{
  flake.modules.homeManager.gaming =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.prismlauncher ];
    };
}
