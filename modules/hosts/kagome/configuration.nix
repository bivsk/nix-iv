{ inputs, ... }:
let
  flake.modules.nixos.robin.imports = with inputs.self.modules.nixos; [
    kvm-amd
    # four
  ];
in
{
  inherit flake;
}
