{ config, ... }:
{
  flake.modules.homeManager.core.imports = with config.flake.modules.homeManager; [
    documentation
    home-manager
    nix
    nix-index-database
    nh
  ];
}
