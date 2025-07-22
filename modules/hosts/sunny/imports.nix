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

    # desktop
    desktop
    dev

    # srv
    jellyfin
    vaultwarden
  ];
}
