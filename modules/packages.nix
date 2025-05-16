{ config, lib, pkgs, ... }: let
  inherit (lib) attrValues optionalAttrs;
in {
  environment.systemPackages = attrValues <| {
    inherit (pkgs)
      asciinema
      cowsay
      curlHTTP3
      dig
      fastfetch
      fd
      htop
      hyperfine
      openssl
      p7zip
      pstree
      rsync
      strace
      timg
      tokei
      traceroute
      tree
      usbutils
      uutils-coreutils-noprefix
      yazi
      yt-dlp
    ;

    fortune = pkgs.fortune.override { withOffensive = true; };
  } // optionalAttrs config.isDesktop {
    inherit (pkgs)
      clang
      clang-tools
      gh
      go
      lld
      mold
      zig

      element-desktop
      gimp
      krita
      libreoffice
      qbittorrent
    ;

    inherit (pkgs.hunspellDicts)
      en_US
    ;
  };
}
