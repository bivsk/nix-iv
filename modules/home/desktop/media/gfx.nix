{
  flake.modules.homeManager.gfx =
    { lib, pkgs, ... }:
    let
      inherit (lib)
        attrValues
        flip
        listToAttrs
        nameValuePair
        ;
    in
    {
      programs.imv.enable = true;

      home.packages = attrValues {
        inherit (pkgs)
          exiftool
          # gimp
          imagemagick
          inkscape
          jpeginfo
          krita
          wl-color-picker
          ;
      };

      xdg.mimeApps.defaultApplications =
        [
          "image/png"
          "image/jpeg"
        ]
        |> map (flip nameValuePair [ "imv.desktop" ])
        |> listToAttrs;
    };
}
