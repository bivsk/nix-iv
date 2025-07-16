{ config, ... }:
{
  flake.modules.homeManager.core.imports = with config.flake.modules.homeManager; [
    code
    documentation
    home-manager
    nix
    nix-index-database
    nh
  ];
}
