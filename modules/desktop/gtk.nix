{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) enabled mkIf merge;
in
merge
<| mkIf config.isDesktop {
  programs.dconf = enabled;

  home-manager.sharedModules = [
    {
      gtk = enabled {
        gtk3.extraCss = config.theme.adwaitaGtkCss;
        gtk4.extraCss = config.theme.adwaitaGtkCss;

        font = with config.theme.font; {
          inherit (sans) name package;

          size = size.normal;
        };

        iconTheme = config.theme.icons;

        theme = {
          name = "Adwaita-dark";
          package = pkgs.gnome-themes-extra;
        };
      };
    }
  ];
}
