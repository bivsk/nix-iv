{
  flake.modules.nixos.desktop =
    { lib, pkgs, ... }:
    {
      console = {
        earlySetup = true;
        font = "Lat2-Terminus16";
        packages = [ pkgs.terminus_font ];
      };

      fonts.packages = lib.attrValues {
        sans = pkgs.lexend;
        mono = pkgs.nerd-fonts.comic-shanns-mono;

        inherit (pkgs)
          material-symbols
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-lgc-plus
          noto-fonts-emoji
          ;
      };
    };
}
