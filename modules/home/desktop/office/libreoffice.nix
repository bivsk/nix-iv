{
  flake.modules.homeManager.libreoffice =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.libreoffice ];
    };
}
