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
	# nsName = "nixarr";
	wgConf = config.secrets.nixarr-vpn-conf.path; 
	accessibleFrom = [
	  "10.0.0.0/24"
	];
      };

      # modules
      nixarr = let
        email = "bivsk@tutanota.com"; 
	domain = "bivsk.com";
      in {
        autobrr.enable = true;
        bazarr.enable = true;
        radarr.enable = true;
	readarr.enable = true;
	readarr-audiobook.enable = true;
        sonarr.enable = true;
	jellyfin = {
	  enable = true;
	  openFirewall = true;
	  # expose.https = {
	  #   enable = true;
	  #   acmeMail = email;
	  #   domainName = "jellyfin.${domain}";
	  # };
	};
	jellyseerr = {
	  enable = true;
	  openFirewall = true;
	  # expose.https = {
	  #   enable = true;
	  #   acmeMail = "bivsk@tutanota.com";
	  #   domainName = "jellyfin.${domain}";
	  # };
	};

        transmission = {
	  enable = true;
	  vpn.enable = true;
	  peerPort = 58420;
	};
      };
    };
}
