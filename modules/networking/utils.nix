{
  flake.modules = {
    nixos.pc =
      { lib, pkgs, ... }:
      {
        environment.systemPackages =
          lib.attrValues
          <| {
            inherit (pkgs)
              bandwhich
              bind
              curl
              dig
              ethtool
              inetutils
              lsof
              rsync
              socat
              traceroute
              wget
              wgetpaste
              ;
          };
      };

    homeManager.gui =
      { lib, pkgs, ... }:
      {
        home.packages =
          lib.attrValues
          <| {
            inherit (pkgs)
              # net
              qbittorrent
              ;
          };
      };
  };
}
