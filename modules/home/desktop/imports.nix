{ config, ... }:
{
  flake.modules.homeManager.desktop.imports = with config.flake.modules.homeManager; [
    code
    editors
    ghostty
    hyprland
    media
    office
    social
    web-browsers
  ];
}
