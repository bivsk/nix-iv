{
  flake.modules.homeManager.torrent = 
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.qbittorrent-enhanced
      ];
    };
}
