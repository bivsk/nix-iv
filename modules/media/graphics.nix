{
  flake.modules.homeManager.gui =
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
      home.packages = attrValues {
        inherit (pkgs)
          exiftool
          gimp
          imagemagick
          imv
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
