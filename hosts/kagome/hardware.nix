{ config, lib, ... }: let
  inherit (lib) enabled;
in {
  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "thunderbolt" "usb_storage" "uas" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  boot.loader.grub = enabled {
    efiSupport = true;
    device = "nodev";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ace8816b-1ea5-444a-8d94-7a4381834abf";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  boot.initrd.luks.devices."luks-5fd805ab-c1dd-4ab7-8e47-c029d4e30996".device = "/dev/disk/by-uuid/5fd805ab-c1dd-4ab7-8e47-c029d4e30996";
  boot.initrd.luks.devices."luks-6479d9bf-f8ed-40cd-a533-6f37bf1d5712".device = "/dev/disk/by-uuid/6479d9bf-f8ed-40cd-a533-6f37bf1d5712";

  fileSystems.${config.boot.loader.efi.efiSysMountPoint} = {
    device = "/dev/disk/by-uuid/6454-F28F";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/28f209f9-5b4e-4d20-be16-41a15ba59037";}
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
