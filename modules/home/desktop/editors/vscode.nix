{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
      };
    };
}
