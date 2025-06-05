{ config, lib, ... }: let
  inherit (lib) attrNames const enabled filterAttrs getAttr;
in {
  # TODO: restrict GUI to desktop systems
  virtualisation.libvirtd = enabled;
  programs.virt-manager = enabled;

  users.extraGroups.libvirtd.members = config.users.users
    |> filterAttrs (const <| getAttr "isNormalUser")
    |> attrNames;

  home-manager.sharedModules = [{
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
	uris = [ "qemu:///system" ];
      };
    };
  }];
}
