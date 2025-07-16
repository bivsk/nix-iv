{
  nixpkgs.allowedUnfreePackages = [ "discord" ];
  flake.modules.homeManager.discord =
    { pkgs, ... }:
    {
      home.packages = [
        (
          (pkgs.discord.override {
            withOpenASAR = true;
            withVencord = true;
          }).overrideAttrs
          (old: {
            nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.makeWrapper ];

            postFixup = ''
                            wrapProgram $out/opt/Discord/Discord \
              	        --set ELECTRON_OZONE_PLATFORM_HINT "auto" \
              		--add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"
            '';
          })
        )
      ];
    };
}
