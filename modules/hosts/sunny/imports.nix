{ inputs, ... }:
{
  nixosHosts.sunny = {
    unstable = true;
  };

  flake.modules.nixos."nixosConfigurations/sunny".imports = with inputs.self.modules.nixos; [
    # hardware
    amdgpu
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
