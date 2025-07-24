{
  flake.modules.homeManager.documentation = {
    programs = {
      tealdeer = {
        enable = true;
        settings = {
	  display.compact = false;
	  display.use_pager = true;
	  updates.auto_update = true;
	};
      };
      info.enable = true;
    };
  };
}
