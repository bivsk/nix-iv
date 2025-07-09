{
  flake.modules = {
    nixos.pc =
      { lib, pkgs, ... }:
      {
        environment.systemPackages =
          lib.attrValues
          <| {
            inherit (pkgs)
              htop
              killall
              moreutils
              pstree
              strace
              ;
          };
      };

    homeManager = {
      base =
        { lib, pkgs, ... }:
        {
          home.packages =
            lib.attrValues
            <| {
              inherit (pkgs)
                asciinema
                cowsay
                fastfetch
                ;
              fortune = pkgs.fortune.override { withOffensive = true; };
            };
        };
      gui =
        { lib, pkgs, ... }:
        {
          home.packages =
            lib.attrValues
            <| {
              inherit (pkgs)
                # office
                libreoffice
                # social
                element-desktop
                telegram-desktop
                ;
            };
        };
    };
  };
}
