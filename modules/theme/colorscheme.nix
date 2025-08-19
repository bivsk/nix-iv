{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    let
      # https://github.com/tinted-theming/schemes/tree/spec-0.11/base16/
      theme = "solarized-dark";
    in
    {
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${theme}.yaml";
    };
}
