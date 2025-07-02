{ inputs, ... }:
let
  flake.modules.nixos.robin.imports = with inputs.self.modules.nixos; [
    kvm-amd
    # four
    gnome-desktop
  ];
in
{
  inherit flake;
}
