{ config, lib, modulesPath, ... }: let
  inherit (lib) enabled;
in {
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.loader.grub = enabled {
    efiSupport = true;
    device = "nodev";
  };

  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/34724de5-e5c9-4546-aec0-9bd3635bce3d";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  fileSystems.${config.boot.loader.efi.efiSysMountPoint} = { 
    device = "/dev/disk/by-uuid/2676-30F1";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" "noatime" ];
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = "x86_64-linux";

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
