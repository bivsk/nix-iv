{ config, ... }:
{
  flake.modules.homeManager.hyprland =
    {
      lib,
      pkgs,
      ...
    }:
    {
      imports = with config.flake.modules.homeManager; [
	hypridle
	hyprlock
        waybar
        wayland
      ];

      xdg.portal = {
        enable = true;
        config.common.default = "*";

        extraPortals = [
          pkgs.xdg-desktop-portal-hyprland
        ];

        configPackages = [
          pkgs.hyprland
        ];
      };

      home.packages = lib.attrValues {
        inherit (pkgs)
          brightnessctl
          grim
          hyprpicker
	  playerctl
          slurp
          swappy
          swaybg
          wl-clipboard
          wtype
          xdg-utils
          ;
      };

      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false; # conflicts with UWSM
      };
    };
}
