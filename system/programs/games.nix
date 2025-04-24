{pkgs, ...}: {
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true; # steam remote play
      localNetworkGameTransfers.openFirewall = true; # lan game transfer

      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];

      gamescopeSession.enable = true;
    };
  };
}
