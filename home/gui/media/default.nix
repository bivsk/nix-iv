{ pkgs, ... }: {
  imports = [
    ./mpv.nix
  ];

  home.packages = with pkgs; [
    # control audio
    pulsemixer
    pwvucontrol

    # images
    #imv

    # streaming
    ani-cli
    spotify

    # graphics
    gimp

    # torrent
    qbittorrent
  ];
}
