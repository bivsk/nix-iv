{ config, lib, pkgs, ... }: let
  inherit (lib) attrValues enabled merge mkIf;
in merge <| mkIf config.isDesktop {
  home-manager.sharedModules = [{
    home.packages = attrValues {
      inherit (pkgs)
        iverilog
	racket
      ;
    };

    programs.vscode = enabled {
      package = pkgs.vscodium;
    };

    programs.zed-editor = enabled {
      extensions = ["nix"];
      userSettings = {
        assistant.enabled = false;

        node = {
          path = lib.getExe pkgs.nodejs;
          npm_path = lib.getExe' pkgs.nodejs "npm";
        };

        hour_format = "hour24";
        auto_update = false;

        lsp = {
          rust-analyzer = {
            binary = {
              path = lib.getExe pkgs.rust-analyzer;
              path_lookup = true;
            };
	  };
        };
      };
    };

    # programs.emacs = enabled {
    #   # client.enable = true;
    #   defaultEditor = true;
    # };
  }];
}
