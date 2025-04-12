{config, pkgs, ...}:
{
  users.users.four = {
    description = "four";
    isNormalUser = true;
    shell = pkgs.bash;
    packages = with pkgs; [
      neovim
    ];
    extraGroups = [
      "input"
      "libvirtd"
      "networkmanager"
      "users"
      "video"
      "wheel"
    ];
  };

  users.groups.four = {};

  # Only allow declarative users
  users.mutableUsers = false;
}
