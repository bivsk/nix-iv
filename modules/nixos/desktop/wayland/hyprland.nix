{
  flake.modules.nixos.desktop = {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
    # programs.uwsm.enable = true;
  };
}
