{ config, ... }:
{
  flake.modules.homeManager.social.imports = with config.flake.modules.homeManager; [
    discord
    element
    signal
    telegram
  ];
}
