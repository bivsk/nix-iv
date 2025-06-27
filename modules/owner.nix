{ config, ... }:
{
  flake = {
    meta.owner = {
      email = "bivsk@tutanota.com";
      name = "four";
      userName = "bivsk";
    };

    modules = {
      nixos.pc = {
        users.users.${config.flake.meta.owner.name} = {
          isNormalUser = true;
          initialPassword = "test";
          extraGroups = [ "input" ];
        };

        nix.settings.trusted-users = [ config.flake.meta.owner.name ];
      };
    };
  };
}
