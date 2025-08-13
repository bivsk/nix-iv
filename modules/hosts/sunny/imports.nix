{ inputs, ... }:
{
  nixosHosts.sunny = {
    unstable = true;
  };

  flake.modules.nixos."nixosConfigurations/sunny".imports = with inputs.self.modules.nixos; [
    # hardware
    amdgpu
    grub
    efi
    kvm-amd
    virtualization

    # desktop
    desktop
    dev

    # services
    nixarr
    vaultwarden
  ];
}
