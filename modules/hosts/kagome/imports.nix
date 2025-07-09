{ inputs, ... }:
{
  flake.modules.nixos."nixosConfigurations/kagome".imports =
    (with inputs.self.modules.nixos; [
      desktop
      efi
      gaming
      gnome-desktop
      kvm-amd
      laptop
    ])
    ++ [ inputs.nixos-hardware.nixosModules.framework-13-7040-amd ];
}
