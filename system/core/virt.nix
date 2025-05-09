{ pkgs, ... }:
{
  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu.runAsRoot = false;
    };
    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["four"];
  users.users.four.extraGroups = ["docker" "libvirtd"];
}
