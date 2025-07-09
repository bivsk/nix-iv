{ lib, ... }:
{
  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        atool
        du-dust
        fd
        file
        unzip
        tokei
      ];
      programs = {
        yazi = {
          enable = true;
          settings = {
            mgr.show_hidden = true;
            open.rules = [
              {
                mime = "*";
                use = "open";
              }
            ];
            opener.open = [
              {
                run = ''${lib.getExe' pkgs.xdg-utils "xdg-open"} "$@"'';
                desc = "Open";
              }
            ];
          };
        };
        ripgrep = {
          enable = true;
          arguments = [
            "--line-number"
            "--smart-case"
          ];
        };
      };
    };
}
