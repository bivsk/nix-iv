{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) merge mkIf;
in
merge
<| mkIf config.isDesktop {
  home-manager.sharedModules = [
    {
      home.packages = with pkgs; [
        # streaming
        ani-cli
        spotify
      ];
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
  ];
}
