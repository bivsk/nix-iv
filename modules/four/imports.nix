{ inputs, ... }:
{
  flake.modules.homeManager.bivsk.imports = [
    inputs.self.modules.homeManager.nix-index
    inputs.self.modules.homeManager.nix-registry
  ];
}
