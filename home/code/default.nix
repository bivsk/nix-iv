{ pkgs, ... }:
{

  # imports = [
  #   ./mpv.nix
  # ];

  home.packages = with pkgs; [
    # D
    dmd
    ldc

    # C
    clang
    clang-tools

    vscode
  ];

  programs.cava = {
    enable = true;
    #settings = {};
  };

  #programs.ncmpcpp.enable = true;

  programs.newsboat = {
    enable = true;
    autoReload = true;
    reloadThreads = 8;
  };
}
