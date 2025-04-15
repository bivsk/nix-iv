{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      # icons
      material-symbols

      # Sans(Serif)
      comic-neue
      libertinus
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      roboto

      # nerd fonts
      nerd-fonts.comic-shanns-mono
      nerd-fonts.symbols-only
    ];

    fontconfig.defaultFonts = {
      serif = ["Libertinus Serif"];
      sansSerif = ["Comic Neue"];
      monospace = ["ComicShannsMono Nerd Font Mono"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
