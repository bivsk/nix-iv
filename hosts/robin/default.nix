lib: lib.nixosSystem' ({ config, lib, ... }: let
  inherit (lib) collectNix remove;
in {
  imports = collectNix ./. |> remove ./default.nix;

  type = "desktop";

  users.users = {
    four = {
      description	= "bivsk";
      isNormalUser	= true;
      extraGroups	= [ "wheel" ];
    };
  };

  home-manager.users = {
    four = {};
  };

  networking = let
    interface = "enp69s0";
  in {
    hostName = "robin";
  };

  # TODO: move this?
  hardware.enableRedistributableFirmware = lib.mkDefault true;

  system.stateVersion = "24.11";
  home-manager.sharedModules = [{
    home.stateVersion = "24.11";
  }];
})
