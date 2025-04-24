{ pkgs, ... }: {
  home.packages = with pkgs; [
    iverilog
    racket
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };
}
