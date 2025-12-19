{ config, ... }:
{
  flake.modules.homeManager.desktop.imports = with config.flake.modules.homeManager; [
    code
    editors
    gaming
    ghostty
    hyprland
    media
    office
    social
    web-browsers
  ];
}
