{
  description = "Four's NixOS flake";

  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org/"
      "https://nix-community.cachix.org/"
    ];

    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    experimental-features = [
      "cgroups"
      "flakes"
      "nix-command"
      "pipe-operators"
    ];

    accept-flake-config = true;
    builders-use-substitutes = true;
    flake-registry = "";
    http-connections = 50;
    show-trace = true;
    use-cgroups = true;
    warn-dirty = false;
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";

      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "nixpkgs";
    };

    fenix.url = "github:nix-community/fenix";

    themes.url = "github:RGBCube/ThemeNix";
  };

  outputs = inputs @ { nixpkgs, ... }: let
    inherit (builtins) readDir;
    inherit (nixpkgs.lib) attrsToList const groupBy listToAttrs mapAttrs nameValuePair;

    lib = nixpkgs.lib.extend <| import ./lib inputs;

    hosts = readDir ./hosts
      |> mapAttrs (name: const <| import ./hosts/${name} lib)
      |> attrsToList
      |> groupBy ({ name, value }:
        if value ? class && value.class == "nixos" then
          "nixosConfigurations"
        else
          "darwinConfigurations")
      |> mapAttrs (const listToAttrs);

    hostConfigs = hosts.nixosConfigurations
      |> attrsToList
      |> map ({name, value}: nameValuePair name value.config)
      |> listToAttrs;
  in hosts // hostConfigs // {
    inherit lib;
  };
}
