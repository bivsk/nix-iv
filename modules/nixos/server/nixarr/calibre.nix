{
  flake.modules.nixos.calibre = {
    services.calibre-server = {
      enable = true;
      port = 4545;
    };
  };
}
