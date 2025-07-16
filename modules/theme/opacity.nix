{
  flake.modules.nixos.desktop =
    { lib, ... }:
    {
      stylix.opacity = lib.genAttrs [ "applications" "desktop" "popups" "terminal" ] (n: 0.85);
    };
}
