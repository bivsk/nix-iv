{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.bitwarden-desktop
        pkgs.bitwarden-cli
      ];
    };
}
