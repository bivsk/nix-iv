{
  flake.modules.nixos.pc =
    { config, lib, ... }:
    let
      inherit (lib)
        attrNames
        const
        filterAttrs
        getAttr
        ;
    in
    {
      virtualisation.libvirtd.enable = true;

      users.extraGroups.libvirtd.members =
        config.users.users |> filterAttrs (const <| getAttr "isNormalUser") |> attrNames;
    };

  # virt-manager
  flake.modules.nixos.desktop.programs.virt-manager.enable = true;

  flake.modules.homeManager.gui = {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
