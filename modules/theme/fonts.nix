{
  flake.modules.nixos.desktop = 
    { config, lib, pkgs, ... }:
    {
      fonts.fontconfig.enable = true;
      stylix.fonts = {
        sansSerif = lib.mkDefault {
	  package = pkgs.lexend;
	  name = "Lexend";
	};

	serif = lib.mkDefault config.stylix.fonts.sansSerif;

        monospace = {
	  package = pkgs.nerd-fonts.comic-shanns-mono;
	  name = "ComicShannsMono Nerd Font";
	};

        emoji = {
	  package = pkgs.google-fonts;
	  name = "Noto Color Emoji";
	};
      };
    };
}
