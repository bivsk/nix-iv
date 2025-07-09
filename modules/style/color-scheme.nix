{ inputs, lib, ... }:
let
  polyModule.stylix = lib.mkDefault {
    base16Scheme = "${inputs.tinted-schemes}/base16/solarized-dark.yaml";
    polarity = "dark";
  };
in
{
  flake.modules = {
    nixos.pc = polyModule;
    homeManager.base = polyModule;
  };
}
