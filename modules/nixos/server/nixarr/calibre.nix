{
  flake.modules.nixos.calibre =
    let
      calibreDir = "/media/nixarr/library/books/.calibre";
      port = 4545;
    in
    {
      services.calibre-server = {
        enable = true;
        port = port;
        auth = {
          enable = true;
          mode = "basic";
          userDb = "${calibreDir}/users.sqlite";
        };
        libraries = [ calibreDir ];
      };

      networking.firewall.allowedTCPPorts = [ port ];
    };
}
