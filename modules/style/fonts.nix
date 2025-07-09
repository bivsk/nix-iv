{ lib, ... }:
let
  polyModule =
    polyArgs@{ pkgs, ... }:
    {
      stylix.fonts = {
        sansSerif = lib.mkDefault {
          package = pkgs.lexend;
          name = "Lexend";
        };

        serif = lib.mkDefault polyArgs.config.stylix.fonts.sansSerif;

        monospace = {
          package = pkgs.nerd-fonts.comic-shanns-mono;
          name = "ComicShannsMono Nerd Font";
        };

        emoji = {
          package = pkgs.google-fonts;
          name = "Noto Color Emoji";
        };

        sizes = {
          applications = 12;
          desktop = 12;
          popups = 12;
          terminal = 12;
        };
      };

      fonts.fontconfig.enable = true;
    };
in
{
  flake.modules = {
    nixos.pc = polyModule;

    homeManager.gui =
      { pkgs, ... }:
      {
        imports = [ polyModule ];
        home.packages = [
          pkgs.google-fonts
          pkgs.gucharmap
        ];
      };
  };
}
