{
  description = "Four's NixOS flake";

  nixConfig = {
    extra-substituters = [
      "https://install.determinate.systems"
      "https://hyprland.cachix.org/"
      "https://nix-community.cachix.org/"
    ];

    extra-trusted-public-keys = [
      "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM"
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    experimental-features = [
      "cgroups"
      "flakes"
      "nix-command"
      "pipe-operators"
    ];

    builders-use-substitutes = true;
    flake-registry = "";
    http-connections = 50;
    lazy-trees = true;
    show-trace = true;
    trusted-users = [ "root" "@build" "@wheel" "@admin" ];
    use-cgroups = true;
    warn-dirty = false;
  };

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*";

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

    crash = {
      url = "github:RGBCube/crash";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    themes.url = "github:bivsk/ThemeNix/zathura";
  };

  outputs = inputs @ { nixpkgs, ... }: let
    inherit (builtins) readDir;
    inherit (nixpkgs.lib) attrsToList const genAttrs groupBy listToAttrs mapAttrs nameValuePair;

    lib = nixpkgs.lib.extend <| import ./lib inputs;

    systems = [ "x86_64-linux" ];
    forAllSystems = genAttrs systems;
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

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
    inherit lib packages;
  };
}
