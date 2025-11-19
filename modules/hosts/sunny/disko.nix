{
  flake.modules.nixos."nixosConfigurations/sunny" =
    { lib, ... }:
    let
      diskNames = [
        "nvme0n1"
        "nvme2n1"
        "nvme3n1"
      ];
      raidzContent = {
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
    in
    {
      # boot.supportedFilesystems = [ "zfs" ];
      networking.hostId = "0ffc592e";
      disko.devices = {
        # Create mirrored partitions on all disks
        disk =
          builtins.listToAttrs (
            lib.imap0 (index: name: {
              inherit name;
              value = {
                type = "disk";
                device = "/dev/${name}";
                content = lib.recursiveUpdate raidzContent {
                  partitions.ESP.content.mountpoint =
                    raidzContent.partitions.ESP.content.mountpoint
                    + (if index == 0 then "" else builtins.toString index);
                };
              };
            }) diskNames
          )
          // {
            sda = {
              type = "disk";
              device = "/dev/sda";
              content = {
                type = "gpt";
                partitions = {
                  zfs = {
                    size = "100%";
                    content = {
                      type = "zfs";
                      pool = "tank";
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
            mode = "raidz";
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
              };

              # backed up datasets
              "safe" = {
                type = "zfs_fs";
                options.mountpoint = "none";
              };
              "safe/home" = {
                type = "zfs_fs";
                options.mountpoint = "/home";
              };
            };
          };

          tank = {
            type = "zpool";
            rootFsOptions = {
              acltype = "posixacl";
              atime = "off";
              compression = "zstd";
              mountpoint = "none";
              xattr = "sa";
            };
            datasets = {
              "media" = {
                type = "zfs_fs";
                options.mountpoint = "/media";
              };
              "media/nixarr" = {
                type = "zfs_fs";
                options.mountpoint = "/media/nixarr";
              };
            };
          };
        };
      };
    };
}
