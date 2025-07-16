{
  flake.modules.nixos.security = {
    security = {
      sudo-rs.enable = true;
      doas.enable = true;
    };

    users.users.four.extraGroups = [ "wheel" ];
  };
}
