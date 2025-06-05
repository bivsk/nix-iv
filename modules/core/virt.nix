{ config, lib, ... }: let
  inherit (lib) attrNames const enabled filterAttrs getAttr merge mkIf;
in merge {
  virtualisation.libvirtd = enabled;

  users.extraGroups.libvirtd.members = config.users.users
    |> filterAttrs (const <| getAttr "isNormalUser")
    |> attrNames;

} <| mkIf config.isDesktop {
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
