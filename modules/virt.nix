{ lib, ... }: let
  inherit (lib) enabled;
in {
  # TODO: restrict GUI to desktop systems
  virtualization.libvirtd = enabled;
  programs.virt-manager = enabled;

  home-manager.sharedModules = [{
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
	uris = [ "qemu:///system" ];
      };
    };
  }];
}
