{ inputs, ... }:
{
  nixosHosts.merry = {
    unstable = true;
  };

  flake.modules.nixos."nixosConfigurations/merry".imports = with inputs.self.modules.nixos; [
    impermanence
    # hardware
    amdgpu
    grub
    efi
    kvm-amd
    virtualization

    desktop
    dev
  ];
}
