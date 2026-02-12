{
  flake.modules.nixos.libvirt =
    { pkgs, ... }:
    {
      virtualisation.libvirtd.enable = true;

      users.extraGroups.libvirtd.members = [ "four" ];

      programs.virt-manager.enable = true;
    };
}
