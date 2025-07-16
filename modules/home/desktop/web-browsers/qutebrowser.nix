{ lib, ... }:
{
  flake.modules.homeManager.qutebrowser = hmArgs: {
    config = {
      programs.qutebrowser = {
        enable = true;
        loadAutoconfig = true;

        keyBindings.normal.e = "edit-url";

        extraConfig = ''
          	  config.unbind("d")
          	'';

        settings = {
          auto_save.session = true;
          tabs.tabs_are_windows = true;
        };
      };

      wayland.windowManager = {
        hyprland.settings.bind = [
          "SUPER, q, exec, ${lib.getExe hmArgs.config.programs.qutebrowser.package}"
        ];
      };

      xdg.mimeApps.defaultApplications =
        [
          "x-scheme-handler/http"
          "x-scheme-handler/https"
          "x-scheme-handler/chrome"
          "text/html"
          "application/x-extension-htm"
          "application/x-extension-html"
          "application/x-extension-shtml"
          "application/xhtml+xml"
          "application/x-extension-xhtml"
          "application/x-extension-xht"
        ]
        |> map (type: lib.nameValuePair type [ "org.qutebrowser.qutebrowser.desktop" ])
        |> lib.listToAttrs;
    };
  };
}
