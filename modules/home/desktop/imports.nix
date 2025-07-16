{ config, ... }:
{
  flake.modules.homeManager.desktop.imports = with config.flake.modules.homeManager; [
    editors
    ghostty
    hyprland
    media
    office
    social
    web-browsers
  ];
}
