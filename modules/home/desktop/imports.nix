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
    web-browsers
  ];
}
