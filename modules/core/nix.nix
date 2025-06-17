{
  self,
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) attrValues attrsToList concatStringsSep const disabled filter filterAttrs flip id isType mapAttrs mapAttrsToList match merge mkAfter mkDefault optionalAttrs optionals;
  inherit (lib.strings) toJSON;

  registryMap =
    inputs
    |> filterAttrs (const <| isType "flake");
in {
  nix.channel = disabled;

  nix.gc = merge {
    automatic = true;
    options = "--delete-older-than 3d";
    dates = "weekly";
    persistent = true;
  };

  nix.nixPath =
    registryMap
    |> mapAttrsToList (name: value: "${name}=${value}")
    |> id;

  nix.registry =
    registryMap
    // {default = inputs.nixpkgs;}
    |> mapAttrs (_: flake: {inherit flake;});

  nix.settings = (import <| self + /flake.nix).nixConfig;

  nix.optimise.automatic = true;

  nixpkgs.config.allowUnfree = mkDefault true;

  environment.systemPackages = attrValues {
    inherit
      (pkgs)
      nh
      nix-index
      nix-output-monitor
      ;
  };
}
