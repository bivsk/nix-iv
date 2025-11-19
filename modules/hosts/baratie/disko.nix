{
  flake.modules.nixos."nixosConfigurations/baratie" =
    { pkgs, ... }:
    {
      boot.supportedFilesystems = [ "zfs" ];
      # /dev/disk/by-id doesn't seem to work on virtual disks
      boot.zfs.devNodes = "/dev/disk/by-uuid";
      networking.hostId = "8425e349";
      disko.devices = {
        disk = {
          main = {
            device = "/dev/vda";
            type = "disk";
            content = {
              type = "gpt";
              partitions = {
                boot = {
                  size = "1M";
                  type = "EF02"; # MBR grub
                };
                ESP = {
                  size = "1G";
                  type = "EF00";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    mountOptions = [ "umask=0077" ];
                  };
                };
                zfs = {
                  size = "100%";
                  content = {
                    type = "zfs";
                    pool = "zroot";
                  };
                };
              };
            };
          };
        };
        zpool = {
          zroot = {
            type = "zpool";
            rootFsOptions = {
              acltype = "posixacl";
              atime = "off";
              compression = "zstd";
              mountpoint = "none";
              xattr = "sa";
            };
            options.ashift = "12";

            datasets = {
              "local" = {
                type = "zfs_fs";
                options.mountpoint = "none";
              };
              "local/nix" = {
                type = "zfs_fs";
                mountpoint = "/nix";
              };
              "local/root" = {
                type = "zfs_fs";
                mountpoint = "/";
              };

              # backed up datasets
              "safe" = {
                type = "zfs_fs";
                options.mountpoint = "none";
              };
            };
          };
        };
      };
    };
}
