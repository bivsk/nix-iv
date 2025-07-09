{ inputs, ... }:
let
  flake.modules.nixos."nixosConfigurations/robin".imports = with inputs.self.modules.nixos; [
    desktop
    efi
    gaming
    gnome-desktop
    kvm-amd

    # srv
    jellyfin
  ];
in
{
  inherit flake;
}
