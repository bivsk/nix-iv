{ inputs, ... }:
{
  flake.modules.nixos.impermanence =
    { pkgs, ... }:
    {
      imports = [ inputs.impermanence.nixosModules.impermanence ];

      environment.persistence."/persist" = {
        enable = true;
        directories = [
          "/var/log"
          "/var/lib/nixos"
          "/var/lib/systemd/coredump"
          # TODO: move to modules
          "/var/lib/acme"
          "/etc/NetworkManager/system-connections"
        ];
      };
      fileSystems."/persist".neededForBoot = true;

      boot.initrd.systemd.enable = true;
      boot.initrd.systemd.services.zfs-rollback = {
        description = "Rollback filesystem to a clean state";
        wantedBy = [ "initrd.target" ];
        after = [ "zfs-import-zroot.service" ];
        before = [ "sysroot.mount" ];
        path = [ pkgs.zfs ];
        unitConfig.DefaultDependencies = "no";
        serviceConfig.Type = "oneshot";
        script = ''
          	  zfs rollback -r zroot/local/root@blank && echo " >> >> Rollback Complete << <<"
          	'';
      };

      services.zfs = {
        trim.enable = true;
        autoScrub.enable = true;
      };
    };
}
