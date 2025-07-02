{
  flake.modules.nixos.kagome = {
    boot.initrd.availableKernelModules = [ "nvme" ];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/ace8816b-1ea5-444a-8d94-7a4381834abf";
      fsType = "ext4";
    };

    boot.initrd.luks.devices."luks-5fd805ab-c1dd-4ab7-8e47-c029d4e30996".device =
      "/dev/disk/by-uuid/5fd805ab-c1dd-4ab7-8e47-c029d4e30996";
    boot.initrd.luks.devices."luks-6479d9bf-f8ed-40cd-a533-6f37bf1d5712".device =
      "/dev/disk/by-uuid/6479d9bf-f8ed-40cd-a533-6f37bf1d5712";

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/6454-F28F";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    swapDevices = [
      { device = "/dev/disk/by-uuid/28f209f9-5b4e-4d20-be16-41a15ba59037"; }
    ];
  };
}
