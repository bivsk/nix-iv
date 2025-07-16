{
  flake.modules.homeManager.home-manager = {
    home.stateVersion = "25.05";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
