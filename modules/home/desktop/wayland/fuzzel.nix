{
  flake.modules.homeManager.fuzzel =
    { config, lib, ... }:
    let
      inherit (lib) mapAttrs replaceStrings;
    in
    {
      wayland.windowManager.hyprland.settings = {
        bindl = [
          (replaceStrings [ "\n;" "\n" ] [ ";" "" ]
            # sh
            ''
              	      , XF86PowerOff, exec,
              	      pkill fuzzel;
              	      echo -en "Suspend\0icon\x1fsystem-suspend\nHibernate\0icon\x1fsystem-suspend-hibernate-alt2\nPower Off\0icon\x1fsystem-shutdown\nReboot\0icon\x1fsystem-reboot"
              	      | fuzzel --dmenu
              	      | tr --delete " "
              	      | tr '[:upper:]' '[:lower:]'
              	      | ifne xargs systemctl
              	    ''
          )
        ];

        bind = [
          "SUPER, SPACE, exec, pkill fuzzel; fuzzel"
          "SUPER, E    , exec, pkill fuzzel; cat ${./emojis.txt} | fuzzel --match-mode exact --dmenu | cut -d ' ' -f 1 | tr -d '\\n' | wl-copy"
          "SUPER+SHIFT, E    , exec, pkill fuzzel; cat ${./emojis.txt} | fuzzel --match-mode exact --dmenu | cut -d ' ' -f 1 | tr -d '\\n' | wtype -"
          "SUPER, V    , exec, pkill fuzzel; cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
        ];
      };

      services.cliphist = {
        enable = true;
        extraOptions = [
          "-max-items"
          "1000"
        ];
      };

      programs.fuzzel = with config.lib.stylix.colors; {
        enable = true;
        settings = {
          main = {
            dpi-aware = true;
            # font = "${config.stylix.fonts.monospace.name}:size=18";
            # icon-theme =

            layer = "overlay";
            prompt = ''"❯ "'';

            terminal = "ghostty -e";

            tabs = 4;

            horizontal-pad = 8;
            vertical-pad = 8;
            inner-pad = 8;
          };

          border = {
            radius = 4;
            width = 2;
          };
        };
      };
    };
}
