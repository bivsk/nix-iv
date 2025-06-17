{
  config,
  lib,
  pkgs,
  themes,
  ...
}:
let
  inherit (lib) mkValue;
in
{
  options.theme =
    mkValue
    <| themes.custom
    <|
      themes.raw.gruvbox-dark-hard
      // {
        cornerRadius = 4;
        borderWidth = 2;

        margin = 8;
        padding = 8;

        font.size.normal = if config.isLaptop then 10 else 12;
        font.size.big = if config.isLaptop then 16 else 18;

        font.sans.name = "Lexend";
        font.sans.package = pkgs.lexend;

        font.mono.name = "ComicShannsMono Nerd Font";
        font.mono.package = pkgs.nerd-fonts.comic-shanns-mono;

        icons.name = "Gruvbox-Plus-Dark";
        icons.package = pkgs.gruvbox-plus-icons;
      };
}
