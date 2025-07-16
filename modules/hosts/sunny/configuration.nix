{ lib, ... }:
{
  flake.modules.nixos."nixosConfigurations/sunny" = {
    networking.hostName = "sunny";
    networking.ipv4.address = "192.168.0.22";

    system = {
      autoUpgrade.enable = false;
      stateVersion = "25.05";
    };
  };
}
