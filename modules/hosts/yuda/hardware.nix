{
  flake.modules.nixos."nixosConfigurations/yuda" =
    {
      lib,
      ...
    }:
    {
      boot = {
        initrd = {
          availableKernelModules = [
            "ata_piix"
            "ehci_pci"
          ];
          kernelModules = [ ];
        };
        # kernelModules = [ "kvm-amd" ];
        extraModulePackages = [ ];
      };

      networking.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    };
}
