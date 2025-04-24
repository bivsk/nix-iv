{ pkgs, ... }: {
  programs.mpv = {
    enable = true;
    defaultProfiles = [ "gpu-hq" ];
    scripts = with pkgs.mpvScripts; [
      uosc
      mpris
      autoload
    ];
  };
}
