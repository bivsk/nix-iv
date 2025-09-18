{
  flake.modules.nixos.calibre = {
    services.calibre-server = {
      enable = true;
      port = 4545;
      auth = {
        enable = true;
        mode = "basic";
        userDb = "/media/calibre/users.sqlite";
      };
      libraries = [ "/media/calibre" ];
    };
  };
}
