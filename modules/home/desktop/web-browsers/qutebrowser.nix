{
  flake.modules.homeManager.qutebrowser = 
    { lib, ... }:
    {
    config = {
      programs.qutebrowser = {
        enable = true;

        keyBindings.normal = {
	  e = "edit-url";
	  M = "hint links spawn mpv {hint-url}";
	};

        extraConfig = ''
          config.unbind("d")
        '';

        settings = {
          auto_save.session = true;
	  content.blocking.method = "both";
	  colors.webpage.darkmode.enabled = true;
	  editor.command = [ "ghostty" "-e" "nvim" "{file}" ];
        };

	searchEngines = {
	  DEFAULT = "https://duckduckgo.com/?q={}";
	  aw = "https://wiki.archlinux.org/?search={}";
	  gw = "https://wiki.gentoo.org/index.php?search={}";
	  nw = "https://nixos.wiki/index.php?search={}";
	  np = "https://search.nixos.org/packages?channel=unstable&query={}";
	  no = "https://search.nixos.org/options?channel=unstable&query={}";
	};
      };

      wayland.windowManager = {
        hyprland.settings.bind = [
          "SUPER, q, exec, qutebrowser"
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
