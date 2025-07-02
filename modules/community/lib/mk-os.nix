{ inputs, lib, ... }:
let
  flake.lib.mk-os = {
    inherit mkNixos;
    inherit linux;
  };

  linux = mkNixos "x86_64-linux" "nixos";

  mkNixos =
    system: cls: name:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        inputs.self.modules.nixos.${cls}
        inputs.self.modules.nixos.${name}
        inputs.self.modules.nixos.${system}
        {
          networking.hostName = lib.mkDefault name;
          nixpkgs.hostPlatform = lib.mkDefault system;
          system.stateVersion = "25.05";
        }
      ];
    };
in
{
  inherit flake;
}
