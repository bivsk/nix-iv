{ config, lib, pkgs, ... }: let
  inherit (lib) attrValues enabled flatten merge mkIf range;
in merge <| mkIf config.isDesktop {
  hardware.graphics = enabled;

  services.logind.powerKey = "ignore";

  xdg.portal = enabled {
    config.common.default = "*";

    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];

    configPackages = [
      pkgs.hyprland
    ];
  };

  programs.xwayland = enabled;

  environment.systemPackages = attrValues {
    inherit (pkgs)
      brightnessctl
      grim
      hyprpicker
      slurp
      swappy
      swaybg
      wl-clipboard
      wtype
      xdg-utils
    ;
  };

  home-manager.sharedModules = [{
    wayland.windowManager.hyprland = enabled {
      systemd = enabled {
        # enableXdgAutostart = true;
      };

      # settings = {};
    };
  }];
}
