{ config, lib, pkgs, self, ... }: let
  inherit (lib) attrValues optionalAttrs;
in {
  environment.systemPackages = attrValues <| {
    inherit (pkgs)
      curlHTTP3
      dig
      fd
      htop
      hyperfine
      openssl
      p7zip
      pciutils
      pstree
      rsync
      strace
      timg
      traceroute
      tree
      usbutils
      uutils-coreutils-noprefix
      wget
      wgetpaste
    ;

  } // optionalAttrs config.isDesktop {
    inherit (pkgs)
      # toolchain
      clang
      clang-tools
      gh
      go
      lld
      mold
      zig
    ;

    inherit (pkgs.hunspellDicts)
      en_US
    ;
  };

  home-manager.sharedModules = [{
    home.packages = attrValues <| {
      inherit (pkgs)
        asciinema
	cowsay
	fastfetch
	tokei
	yazi
	yt-dlp
      ;
      fortune = pkgs.fortune.override { withOffensive = true; };
    } // optionalAttrs config.isDesktop {
      inherit (pkgs)
        # gfx
	gimp
	krita

	# office
	libreoffice
	tradingview

	# social
	element-desktop
	telegram-desktop

	# crypto wallets
	ledger-live-desktop
	monero-gui
	trezor-suite
	
	# net
	qbittorrent
        ;
        tari-universe = self.packages.x86_64-linux.tari-universe;
    };
  }];
}
