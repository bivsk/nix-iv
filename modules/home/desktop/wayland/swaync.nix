{
  flake.modules.homeManager.swaync = {
    services.swaync = {
      enable = true;
    };

    hyprland = {
      wayland.windowManager.hyprland.settings = {
        bind = [ "SUPER, slash, exec, swaync-client -t -sw" ];
      };
    };
  };
}
