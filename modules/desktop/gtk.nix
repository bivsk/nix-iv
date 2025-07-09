{
  flake.modules.homeManager.gui = 
    { pkgs, ... }:
    {
      gtk = {
        enable = true;
        # TODO: stylix
        # gtk3.extraCss = config.theme.adwaitaGtkCss;
        # gtk4.extraCss = config.theme.adwaitaGtkCss;

        font = {
          name = "Lexend";
          package = pkgs.lexend;
          size = 12;
        };

        theme = {
          name = "Adwaita-dark";
          package = pkgs.gnome-themes-extra;
        };
      };
    };
}
