{
  flake.modules.nixos.libvirt =
    { pkgs, ... }:
    {
      virtualisation.libvirtd.enable = true;

      users.extraGroups.libvirtd.members = [ "four" ];

      home-manager.sharedModules = [
        {
          # virt-manager
          home.packages = [ pkgs.dconf ];
          dconf.settings = {
            "org/virt-manager/virt-manager/connections" = {
              autoconnect = [ "qemu:///system" ];
              uris = [ "qemu:///system" ];
            };
          };
        }
      ];
    };
}
