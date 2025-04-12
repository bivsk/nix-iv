{pkgs, ...}: {
  programs.zathura = {
    enable = true;
    options = {
#      font = "Inter 12";
      selection-notification = true;

      selection-clipboard = "clipboard";
      adjust-open = "best-fit";
      pages-per-row = "1";
      scroll-page-aware = "true";
      scroll-full-overlap = "0.01";
      scroll-step = "100";
      zoom-min = "10";
    };

    extraConfig = "include solarized-dark";
  };

  xdg.configFile = {
    "zathura/solarized-dark".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/lennonwoo/zathura-solarized/master/zathura-solarized-dark";
      hash = "sha256-0GJsjdQl9ZkNYucI//1Q8iXtkxCzdIMU6VbnYlNJazg";
    };
    "zathura/solarized-light".source = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/lennonwoo/zathura-solarized/master/zathura-solarized-light";
      hash = "sha256-W+STF7UlgSpoyvCZimukEaqFnteu+oBRWCXaiunID0g";
    };
  };
}
