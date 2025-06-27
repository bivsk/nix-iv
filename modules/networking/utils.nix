{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        bandwhich
        bind # for dig
        curl
        ethtool
        gping
        inetutils
        rsync
        socat
        traceroute
        wget
        wgetpaste
      ];
    };
}
