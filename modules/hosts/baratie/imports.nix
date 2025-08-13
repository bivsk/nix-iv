{ inputs, ... }:
{
  nixosHosts.baratie = {
    unstable = true;
  };

  flake.modules.nixos."nixosConfigurations/baratie".imports = with inputs.self.modules.nixos; [
    grub
    impermanence

    # reverse proxies
    acme
    nginx-jellyfin
    nginx-jellyseerr
    nginx-sonarr
  ];
}
