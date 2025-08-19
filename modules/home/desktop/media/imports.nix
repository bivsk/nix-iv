{ config, ... }:
{
  flake.modules.homeManager.media.imports = with config.flake.modules.homeManager; [
    anime
    foliate
    gfx
    mpv
    spotify
    torrent
    zathura
  ];
}
