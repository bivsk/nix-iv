{
  flake.modules.nixos.nixarr = 
    { config, inputs, ... }:
    {
      imports = [ inputs.nixarr.nixosModules.default ];

      nixarr = {
        enable = true;
        # cannot be under any non-root owned dir
	mediaDir = "/data/media";
	stateDir = "/data/media/.state/nixarr";
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

      # modules
      nixarr = {
        bazarr.enable = true;
	prowlarr.enable = true;
        radarr.enable = true;
	readarr.enable = true;
	readarr-audiobook.enable = true;
        sonarr.enable = true;

	jellyfin = {
	  enable = true;
	  openFirewall = true;
	};
	jellyseerr = {
	  enable = true;
	  openFirewall = true;
	};

        transmission = {
	  enable = true;
	  vpn.enable = true;
	  peerPort = 58420;
	};
      };

      services.jackett = {
        enable = true;
	dataDir = "/data/media/.state/jackett";
      };
    };
}
