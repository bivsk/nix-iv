{
  flake.modules.nixos.calibre =
    let
      calibreDir = "/media/nixarr/library/books/.calibre";
    in
    {
      services.calibre-server = {
        enable = false;
        port = 4545;
        auth = {
          enable = true;
          mode = "basic";
          userDb = "${calibreDir}/users.sqlite";
        };
        libraries = [ calibreDir ];
      };
    };
}
