{
  flake.modules.homeManager.core = {
    home = {
      sessionVariables = {
        MANPAGER = "bat --plain";
        PAGER = "bat --plain";
      };
      shellAliases = {
        cat = "bat";
        less = "bat --plain";
      };
    };
    programs.bat = {
      enable = true;
      config.pager = "less -FR";
    };
  };
}
