{
  flake.modules.nixos.libvirt = {
    virtualisation.libvirtd.enable = true;

    users.extraGroups.libvirtd.members = [ "four" ];

    home-manager.sharedModules = [
      {
        # virt-manager
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
