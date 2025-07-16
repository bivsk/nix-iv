{
  flake.modules.nixos.networking =
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
}
