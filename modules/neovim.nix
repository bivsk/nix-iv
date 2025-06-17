{lib, ...}: let
  inherit (lib) enabled;
in {
  programs.neovim = enabled;
}
