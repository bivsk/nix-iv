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

    # rust
    rustc
    cargo
    rust-analyzer
    rustfmt
    #rustup

    # slop
    typescript
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.vscode = {
    enable = true;
    #package = pkgs.vscodium;
    mutableExtensionsDir = true;
  };

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
