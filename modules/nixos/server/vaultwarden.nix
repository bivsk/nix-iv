{
  flake.modules.nixos.vaultwarden = {
    services.vaultwarden = {
      enable = true;
    };
  };
}
