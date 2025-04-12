{ pkgs, ... }:
{
  imports = [
  ];

  home.packages = with pkgs; [
    # audio control
    playerctl
    pulsemixer
    pwvucontrol
    helvum

    # audio
    amberol
    ncmpcpp
    spotify

    # image
    imv

    # video
    ani-cli
    libva-utils
    vdpauinfo
    vulkan-tools
    glxinfo
  ];

  programs.cava = {
    enable = true;
    #settings = {};
  };

  programs.mpv = {
    enable = true;
    defaultProfiles = [ "gpu-hq" ];
    scripts = with pkgs.mpvScripts; [
      autoload
      mpris
    ];
  };

  programs.ncmpcpp.enable = true;

  programs.newsboat = {
    enable = true;
    autoReload = true;
    reloadThreads = 8;
  };

  services.playerctld.enable = true;
}
