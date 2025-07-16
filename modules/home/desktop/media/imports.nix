{ config, ... }:
{
  flake.modules.homeManager.media.imports = with config.flake.modules.homeManager; [
    anime
    gfx
    mpv
    spotify
    zathura
  ];
}
