{
  flake.modules.nixos.libvirt =
    { pkgs, ... }:
    {
      virtualisation.libvirtd.enable = true;

      users.extraGroups.libvirtd.members = [ "four" ];

      # TODO: gui only
      programs.virt-manager.enable = true;
    };
}
