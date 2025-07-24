{
  flake.modules.homeManager.hypridle = {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
	  lock_cmd = "pidof hyprlock || hyprlock";
	  before_sleep_cmd = "loginctl lock-session";
	  after_sleep_cmd = "hyprctl dispatch dpms on";
	  ignore_dbus_inhibit = false;
	};
	listener = [
	  {
	    timeout = 900; # 15min
	    on-timeout = "loginctl lock-session";
	  }
	  {
	    timeout = 1200; # 20min
	    on-timeout = "hyprctl dispatch dpms off";
	    on-resume = "hyprctl dispatch dpms on && brightnessctl -r";
	  }
	];
      };
    };
  };
}
