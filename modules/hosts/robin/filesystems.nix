{
  flake.modules.nixos.robin = {

    boot.initrd.availableKernelModules = [ "nvme" ];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/34724de5-e5c9-4546-aec0-9bd3635bce3d";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/2676-30F1";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    swapDevices = [ ];
  };
}
