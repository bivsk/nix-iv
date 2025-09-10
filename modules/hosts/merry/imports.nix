{ inputs, ... }:
{
  nixosHosts.merry = {
    unstable = true;
  };

  flake.modules.nixos."nixosConfigurations/merry".imports = with inputs.self.modules.nixos; [
    # hardware
    amdgpu
    fprintd
    grub
    efi
    kvm-amd
    virtualization

    desktop
    dev
    impermanence
  ];
}
