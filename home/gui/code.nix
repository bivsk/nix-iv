{ pkgs, ... }: {
  home.packages = with pkgs; [
    iverilog
    racket
    nixd
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

  services.emacs = {
    enable = true;
    client.enable = true;
    defaultEditor = true;
  };
}
