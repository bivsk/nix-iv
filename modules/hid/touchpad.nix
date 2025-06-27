{
  flake.modules.homeManager.gui = {
    wayland.windowManager.hyprland.settings.input.touchpad = {
      clickfinger_behavior = true;
      drag_lock = 1; # enabled with timeout
      natural_scroll = true;
      scroll_factor = 0.7;
    };
  };
}
