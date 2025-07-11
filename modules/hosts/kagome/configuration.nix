{ lib, ... }:
{
  flake.modules.nixos."nixosConfigurations/kagome".networking.ipv4.address = "192.168.0.29";
  flake.modules.homeManager."homeConfigurations/kagome".wayland.windowManager.hyprland.settings.monitor = lib.mkForce [ ", preferred, auto, 2, vrr, 3" ];
}
