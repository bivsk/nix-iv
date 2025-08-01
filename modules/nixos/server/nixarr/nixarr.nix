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
      };

      # modules
      nixarr = {
        autobrr.enable = true;
        bazarr.enable = true;
        radarr.enable = true;
	readarr.enable = true;
	readarr-audiobook.enable = true;
        sonarr.enable = true;
	# jellyfin.enable = true;
	# jellyseerr.enable = true;

        transmission = {
	  enable = true;
	  vpn.enable = true;
	  peerPort = 58420;
	};
      };
    };
}
