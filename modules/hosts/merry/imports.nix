{ inputs, ... }:
{
  nixosHosts.merry = {
    unstable = true;
  };

  flake.modules.nixos."nixosConfigurations/merry".imports = with inputs.self.modules.nixos; [
    # hardware
    amdgpu
    efi
    kvm-amd

    # desktop
    desktop
    dev

    laptop
  ];
}
