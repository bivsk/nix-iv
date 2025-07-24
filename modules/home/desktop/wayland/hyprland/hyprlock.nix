{
  flake.modules.homeManager.hyprlock = {
    programs.hyprlock = {
      enable = true;
      settings = {
        auth = {
	  fingerprint.enabled = true;
	};
	input-field = {
	  size = "600, 100";
	  position = "0, 0";
	  halign = "center";
	  valign = "center";

          font_family = "ComicShannsMono Nerd Font";

	  outline_thickness = 4;

	  placeholder_text = "Enter Password 󰈷 ";
	  fail_text = "<i>$PAMFAIL ($ATTEMPTS)</i>";
	  fade_on_empty = false;
	};
      };
    };
  };
}
