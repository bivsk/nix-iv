{
  flake.modules.nixos.jellyfin = {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };
}
