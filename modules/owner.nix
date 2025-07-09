{ config, ... }:
{
  flake = {
    meta.owner = {
      email = "bivsk@tutanota.com";
      name = "four";
      username = "bivsk";
    };

    modules = {
      nixos.pc = {
        users.users.${config.flake.meta.owner.name} = {
          isNormalUser = true;
          initialPassword = "";
          extraGroups = [ "input" ];
        };

        nix.settings.trusted-users = [ config.flake.meta.owner.name ];
      };
    };
  };
}
