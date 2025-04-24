{ config, ... }:
let
  data_dir = config.xdg.dataHome;
  conf_dir = config.xdg.configHome;
  cache_dir = config.xdg.cacheHome;
in {
  imports = [
    ./shells
    ./git.nix
  ];

  home.homeDirectory = "/home/four";
  home.sessionVariables = {
    # clean up home
    LESSHISTFILE = cache_dir + "/less/history";
    LESSKEY = conf_dir + "/less/lesskey";
    WINEPREFIX = data_dir + "/wine";

    # default apps
    #BROWSER = "firefox";
  };
}
