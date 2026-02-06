{ inputs, ... }:
{
  # TODO: remove all this for now
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
    # atticd
    hercules-ci-agent
    nixarr
    p2poolix
    # garage
  ];
}
