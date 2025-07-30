{
  flake.modules.nixos.security = {
    security = {
      sudo-rs.enable = true;
      doas.enable = true;
    };
  };
}
