{
  flake.modules.nixos."nixosConfigurations/sunny" = {
    boot.supportedFilesystems = [ "zfs" ];
    networking.hostId = "af7bc4fa";
    disko.devices = {
      disk = {
        nvme0n1 = {
          device = "/dev/nvme0n1";
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
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
      # Configure zpool/datasets
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
          options.ashift = "13";

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
              postCreateHook = "zfs list -t snapshot -H -o name | grep -E '^zroot/local/root@blank$' || zfs snapshot zroot/local/root@blank";
            };

            # backed up datasets
            "safe" = {
              type = "zfs_fs";
              options.mountpoint = "none";
            };
            "safe/persist" = {
              type = "zfs_fs";
              mountpoint = "/persist";
            };
            "safe/home" = {
              type = "zfs_fs";
              mountpoint = "/home";
            };
          };
        };
      };
    };
  };
}
