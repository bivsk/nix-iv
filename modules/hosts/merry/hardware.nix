{
  flake.modules.nixos."nixosConfigurations/merry" =
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
        (modulesPath + "/installer/scan/not-detected.nix")
        inputs.nixos-hardware.nixosModules.framework-13-7040-amd
      ];

      boot = {
        # Use latest linux kernel
        # kernelPackages = pkgs.linuxPackages_latest;

        initrd = {
          availableKernelModules = [
            "nvme"
            "sd_mod"
            "thunderbolt"
            "usb_storage"
            "xhci_pci"
          ];
          kernelModules = [ "dm-snapshot" ];
        };
        kernelModules = [ "kvm-amd" ];
        extraModulePackages = [ ];
      };

      networking.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.enableRedistributableFirmware = true;
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
