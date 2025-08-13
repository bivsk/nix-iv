{
  flake.modules.nixos."nixosConfigurations/baratie" =
    { lib, ... }:
    {
      age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFFYe9FVPVOQ3N3UtIZwuKaoSkZTIncRqkQoGfjL822+";

      users.users.root.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPgHRgDdmenFi5SH02Rrja7iICXUAQQJqdQACPLY9S/1 four@robin"
      ];

      networking.hostName = "baratie";

      networking.firewall.allowedTCPPorts = [
        80
        443
      ];

      boot.loader.timeout = 0;
      # boot.loader.grub.device = lib.mkForce "/dev/vda";

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };

      # move to ssh nixos module
      services.openssh = {
        enable = true;
	hostKeys = [
	  {
	    path = "/persist/ssh/ssh_host_ed25519_key";
	    type = "ed25519";
	  }
	  {
	    path = "/persist/ssh/ssh_host_rsa_key";
	    type = "rsa";
	    bits = 4096;
	  }
	];
      };
    };
}
