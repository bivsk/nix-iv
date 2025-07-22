{
  flake.modules.homeManager.core =
    { lib, pkgs, ... }:
    {
      home.packages = lib.attrValues {
        inherit (pkgs)
          fd
          file
          httpie
          jq
          unzip
          ;
      };
      programs = {
        ripgrep = {
          enable = true;
          arguments = [
            "--line-number"
            "--smart-case"
          ];
        };
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
      };
    };
}
