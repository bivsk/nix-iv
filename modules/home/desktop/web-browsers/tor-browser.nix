{
  flake.modules.homeManager.tor-browser =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.tor-browser-bundle-bin ];
    };
}
