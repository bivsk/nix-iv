{
  flake.modules.nixos.nixarr =
    { config, inputs, ... }:
    {
      imports = [
        inputs.nixarr.nixosModules.default
        inputs.self.modules.nixos.calibre
      ];

      nixarr = {
        enable = true;
        mediaDir = "/media/nixarr";
        stateDir = "/media/nixarr/.state";
      };

      secrets.nixarr-vpn-conf.rekeyFile = ./nixarr-vpn-conf.age;
      nixarr.vpn = {
        enable = true;
        wgConf = config.secrets.nixarr-vpn-conf.path;
        vpnTestService.enable = true;
        accessibleFrom = [
          "10.0.0.0/24"
        ];
      };

      nixarr = {
        bazarr.enable = true;
        prowlarr.enable = true;
        radarr.enable = true;
        readarr.enable = true;
        transmission = {
          enable = true;
          flood.enable = true;
          vpn.enable = true;
          peerPort = 58420;
        };
      };
    };
}
