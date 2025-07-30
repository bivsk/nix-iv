{ inputs, ... }:
{
  nixosHosts.baratie = {
    unstable = true;
  };

  flake.modules.nixos."nixosConfigurations/baratie".imports = with inputs.self.modules.nixos; [
    # bivsk
    acme
    nginx-jellyfin
    nginx-jellyseerr

    # setup hm
    # TODO: remove home-manager dependency
    # either remove use of sharedModules in nixos modules, or find a workaround/fix
    dev
  ];
}
