{ config, lib, pkgs, ... }: let
  inherit (lib) enabled;
in {
  home-manager.sharedModules = [{
    xdg.configFile."btop/themes/base16.theme".text = config.theme.btopTheme;

    programs.btop = enabled {
      package = if config.isDesktop then pkgs.btop else pkgs.btop-rocm;

      settings.color_theme = "base16";
      settings.rounded_corners = config.theme.cornerRadius > 0;
    };
  }];
}

