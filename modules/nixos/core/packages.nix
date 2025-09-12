{
  flake.modules.nixos.core =
    { lib, pkgs, ... }:
    {
      environment.systemPackages = lib.attrValues {
        inherit (pkgs)
          dig
          file
          git
          killall
          lsof
          nfs-utils
          pciutils
          ripgrep
          tree
          unzip
          usbutils
          wget
          zip
          ;
      };

      programs.htop = {
        enable = true;
        settings = {
          highlight_base_name = 1;
	  show_cpu_temperature = 1;
	  column_meters_0 = "LeftCPUs2 GPU Memory Swap ZFSARC";
	  column_meter_modes_0 = "1 1 1 1 2";
	  column_meters_1 = "RightCPUs2 Tasks LoadAverage Uptime Hostname";
	  column_meter_modes_1 = "1 2 2 2 2";
        };
      };
    };
}
