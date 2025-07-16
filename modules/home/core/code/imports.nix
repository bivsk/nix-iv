{ config, ... }:
{
  flake.modules.homeManager.code.imports = with config.flake.modules.homeManager; [
    haskell
  ];
}
