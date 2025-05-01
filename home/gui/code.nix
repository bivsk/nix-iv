{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    iverilog
    racket
    nixd
    rust-analyzer
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };

  programs.emacs = {
    enable = true;
    # package = pkgs.emacsPackages.doom;
    extraPackages = epkgs: [
      epkgs.doom
    ];
  };

  programs.zed-editor = {
    enable = true;
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

  services.emacs = {
    enable = true;
    client.enable = true;
    defaultEditor = true;
  };
}
