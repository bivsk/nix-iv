{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) attrValues enabled merge mkIf;
in
  merge
  <| mkIf config.isDesktop {
    home-manager.sharedModules = [
      {
        home.packages = attrValues {
          inherit
            (pkgs)
            iverilog
            racket
            ;
        };

        programs.vscode = enabled {
          package = pkgs.vscodium;
        };

        # programs.emacs = enabled {
        #   # client.enable = true;
        #   defaultEditor = true;
        # };
      }
    ];
  }
