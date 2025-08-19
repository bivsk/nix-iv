{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      stylix.iconTheme = {
        enable = true;
	package = pkgs.tela-icon-theme;
	light = "Tela";
	dark = "Tela";
      }; 
    };
}
