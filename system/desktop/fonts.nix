{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      # icons
      material-symbols
      nerd-fonts.symbols-only

      # Sans(Serif)
      comic-neue
      libertinus
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      roboto

      # monospace
      comic-mono
    ];

    fontconfig.defaultFonts = {
      serif = ["Libertinus Serif"];
      sansSerif = ["Comic Neue"];
      monospace = ["Comic Mono"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
