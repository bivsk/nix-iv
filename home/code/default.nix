{ pkgs, ... }:
{
  imports = [
    ./editors.nix
  ];

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
    nodejs
    typescript

    # misc
    jq
  ];

  programs.git = {
    enable = true;
    userName = "bivsk";
    userEmail = "bivsk@tutanota.com";
  };
}
