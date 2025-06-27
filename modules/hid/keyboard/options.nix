{
  flake.modules.homeManager.gui = {
    wayland.windowManager = {
      hyprland.settings = {
        input.kb_options = "ctrl:nocaps";
      };
    };
  };
}
