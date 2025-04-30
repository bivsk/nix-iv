{ inputs, config, pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.system}.default.override { enableX11 = false; };
    enableBashIntegration = true;
    installBatSyntax = false;
    settings = {
      font-family = "ComicShannsMono Nerd Font Mono";
      theme = "Solarized Dark - Patched";
      background-opacity = 0.93;
      # window-decoration = false;
      window-padding-x = 6;
      window-padding-y = 6;
      confirm-close-surface = false;
    };
  };
}
