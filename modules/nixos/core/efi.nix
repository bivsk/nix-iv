{
  flake.modules.nixos.efi = 
    { pkgs, ... }:
    {
      boot.loader = {
        efi.canTouchEfiVariables = true;
        grub.efiSupport = true;
      };

      home-manager.sharedModules = [
        {
          home.packages = [
	    pkgs.efivar
	    pkgs.efibootmgr
	  ];
        }];
    };
}
