{
  nixpkgs.allowedUnfreePackages = [ "discord" ];
  flake.modules.homeManager.desktop = {
    programs.vesktop.enable = true;
  };
}
