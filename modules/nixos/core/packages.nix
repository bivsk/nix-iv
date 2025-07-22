{
  flake.modules.nixos.core =
    { lib, pkgs, ... }:
    {
      environment.systemPackages = lib.attrValues {
        inherit (pkgs)
          dig
          file
          git
          htop
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
    };
}
