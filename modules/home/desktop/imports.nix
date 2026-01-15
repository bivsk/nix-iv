{ config, ... }:
{
  flake.modules.homeManager.desktop.imports = with config.flake.modules.homeManager; [
    code
    gaming
    ghostty
    hyprland
    media
    office
    web-browsers
  ];
}
