{config, pkgs, ...}:
{
  users.users.four = {
    isNormalUser = true;
    shell = pkgs.bash;
    extraGroups = [
      "input"
      "libvirtd"
      "networkmanager"
      "users"
      "video"
      "wheel"
    ];
  };

  # Only allow declarative users
  #users.mutableUsers = false;
}
