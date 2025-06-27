{ config, ... }:
{
  flake.modules = {
    nixos.workstation = {
      virtualisation.libvirtd.enable = true;
      users.extraGroups.libvirtd.members = [ config.flake.meta.owner.name ];

      programs.virt-manager.enable = true;
    };

    homeManager.gui = {
      dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = [ "qemu:///system" ];
          uris = [ "qemu:///system" ];
        };
      };
    };
  };
}
