{ config, ... }:
{
  flake.modules.homeManager."homeConfigurations/merry" =
    { lib, ... }:
    {
      imports = with config.flake.modules.homeManager; [
        desktop
      ];

      # 2x scaling
      wayland.windowManager.hyprland.settings.monitor = lib.mkForce [ ", preferred, auto, 2, vrr, 3" ];
    };
}
