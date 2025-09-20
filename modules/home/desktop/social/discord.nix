{
  nixpkgs.allowedUnfreePackages = [ "discord" ];
  flake.modules.homeManager.discord = {
    programs.vesktop.enable = true;
  };
}
