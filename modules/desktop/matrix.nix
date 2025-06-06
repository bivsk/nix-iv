{ config, lib, pkgs, ... }: let
  inherit (lib) merge mkIf;
in merge <| mkIf config.isDesktop {
  environment.systemPackages = [
    ((pkgs.element-desktop.override {}).overrideAttrs (old: {
      nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.makeWrapper ];

      postFixup = ''
        wrapProgram $out/bin/element-desktop \
          --set ELECTRON_OZONE_PLATFORM_HINT "auto" \
          --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"
      '';
    }))
  ];
}
