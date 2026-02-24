{
  flake.modules.homeManager.helium =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.nur.repos.Ev357.helium ];
    };
}
