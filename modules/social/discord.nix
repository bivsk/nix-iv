let
  flake.modules.homeManager.gui =
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
in
{
  inherit flake;
  nixpkgs.allowedUnfreePackages = [
    "discord"
  ];
}
