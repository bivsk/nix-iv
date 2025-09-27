{
  flake.modules.nixos."nixosConfigurations/baratie" =
    {
      config,
      lib,
      modulesPath,
      pkgs,
      inputs,
      ...
    }:
    {
      imports = [
        (modulesPath + "/profiles/qemu-guest.nix")
      ];

      boot = {
        initrd = {
          availableKernelModules = [
            "ata_piix"
            "uhci_hcd"
            "virtio_pci"
            "sr_mod"
            "virtio_blk"
          ];
          kernelModules = [ ];
        };
        kernelModules = [ "kvm-amd" ];
        extraModulePackages = [ ];
      };

      networking.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
