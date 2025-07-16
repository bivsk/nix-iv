{
  flake.modules.homeManager.zathura = {
    programs.zathura = {
      enable = true;
      options = {
        recolor = true;
      };
    };
    xdg.mimeApps.defaultApplications = {
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
    };
  };
}
