lib: lib.nixosSystem' ({ config, keys, lib, ... }: let
  inherit (lib) collectNix remove;
in {
  imports = collectNix ./. |> remove ./default.nix;

  type = "desktop";

  secrets.id.file = ./id.age;
  services.openssh.hostKeys = [{
    type = "ed25519";
    path = config.secrets.id.path;
  }];

  secrets.password.file = ./password.age;
  users.users = {
    root = {
      openssh.authorizedKeys.keys = keys.admins;
      hashedPasswordFile = config.secrets.password.path;
    };

    four = {
      description	= "Four";
      openssh.authorizedKeys.keys = keys.admins;
      hashedPasswordFile = config.secrets.password.path;
      isNormalUser	= true;
      extraGroups	= [ "wheel" ];
    };
  };

  home-manager.users = {
    root = {};
    four = {};
  };

  networking = let
    interface = "enp69s0";
  in {
    hostName = "robin";
    ipv4.address = "192.168.0.22";
  };

  # # TODO: move this?
  hardware.enableRedistributableFirmware = lib.mkDefault true;

  system.stateVersion = "24.11";
  home-manager.sharedModules = [{
    home.stateVersion = "24.11";
  }];
})
