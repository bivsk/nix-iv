{ config, lib, ... }: let
  inherit (lib) enabled merge mkIf;
in merge <| mkIf config.isDesktop {
  home-manager.sharedModules = [{
    wayland.windowManager.hyprland.settings = {
      bind = [ "SUPER, slash, exec, swaync-client -t -sw" ];
    };

    services.swaync = with config.theme.withHashtag; enabled {
      settings = {
        control-center-margin-top = margin;
        control-center-margin-bottom = margin;
        control-center-margin-right = margin;
        control-center-margin-left = margin;
	notification-icon-size = 64;
	notification-body-image-height = 100;
	notification-body-image-width = 200;
	timeout = 10;
	timeout-low = 5;
	timeout-critical = 0;
	control-center-width = 380;
	notification-window-width = 500;
	image-visibility = "when-available";
	transition-time = 200;
	fit-to-screen = true;
	hide-on-clear = true;
	hide-on-action = true;
	script-fail-notify = true;
	widget-config = {
	  title = {
	    text = "Notification Center";
	    clear-all-button = true;
	    button-text = "󰆴 Clear All";
	  };
	  dnd = {
	    text = "Do Not Disturb";
	  };
	  label = {
	    max-lines = 1;
	    text = "Notification Center";
	  };
	  mpris = {
	    image-size = 96;
	    image-radius = 7;
	  };
	  volume = {
	    label = "󰕾";
	  };
	  backlight = {
	    label = "󰃟";
	  };
	};
	widgets = if config.isLaptop
	then [ "title" "mpris" "volume" "backlight" "dnd" "notifications" ]
	else [ "title" "mpris" "volume" "dnd" "notifications" ];
      };

      style = ''
        * {
          font-family: ${font.sans.name};
          font-weight: bold;
        }
        .control-center .notification-row:focus,
        .control-center .notification-row:hover {
          opacity: 0.9;
          background: ${base00}
        }
        .notification-row {
          outline: none;
          margin: ${toString margin};
          padding: 0;
        }
        .notification {
          background: transparent;
          padding: 0;
          margin: 0px;
        }
        .notification-content {
          background: ${base00};
          padding: ${toString padding};
          border-radius: ${toString cornerRadius};
          border: ${toString borderWidth} solid ${base0D};
          margin: 0;
        }
        .notification-default-action {
          margin: 0;
          padding: 0;
          border-radius: ${toString cornerRadius};
        }
        .close-button {
          background: ${base08};
          color: ${base00};
          text-shadow: none;
          padding: 0;
          border-radius: ${toString cornerRadius};
          margin-top: ${toString margin};
          margin-right: ${toString margin};
        }
        .close-button:hover {
          box-shadow: none;
          background: ${base0D};
          transition: all .15s ease-in-out;
          border: none
        }
        .notification-action {
          border: ${toString borderWidth} solid ${base0D};
          border-top: none;
          border-radius: ${toString cornerRadius};
        }
        .notification-default-action:hover,
        .notification-action:hover {
          color: ${base0B};
          background: ${base0B}
        }
        .notification-default-action {
          border-radius: ${toString cornerRadius};
          margin: 0px;
        }
        .notification-default-action:not(:only-child) {
          border-bottom-left-radius: ${toString cornerRadius};
          border-bottom-right-radius: ${toString cornerRadius}
        }
        .notification-action:first-child {
          border-bottom-left-radius: ${toString cornerRadius};
          background: ${base00}
        }
        .notification-action:last-child {
          border-bottom-right-radius: ${toString cornerRadius};
          background: ${base00}
        }
        .inline-reply {
          margin-top: ${toString margin}
        }
        .inline-reply-entry {
          background: ${base00};
          color: ${base05};
          caret-color: ${base05};
          border: ${toString (builtins.floor (borderWidth / 2))} solid ${base09};
          border-radius: ${toString cornerRadius}
        }
        .inline-reply-button {
          margin-left: 4px;
          background: ${base00};
          border: ${toString (builtins.floor (borderWidth / 2))} solid ${base09};
          border-radius: ${toString cornerRadius};
          color: ${base05}
        }
        .inline-reply-button:disabled {
          background: initial;
          color: ${base03};
          border: ${toString (builtins.floor (borderWidth / 2))} solid transparent
        }
        .inline-reply-button:hover {
          background: ${base00}
        }
        .body-image {
          margin-top: ${toString margin};
          background-color: ${base05};
          border-radius: ${toString cornerRadius}
        }
        .summary {
          font-size: ${toString font.size.big};
          font-weight: 700;
          background: transparent;
          color: rgba(158, 206, 106, 1);
          text-shadow: none
        }
        .time {
          font-size: ${toString font.size.big};
          font-weight: 700;
          background: transparent;
          color: ${base05};
          text-shadow: none;
          margin-right: 18px
        }
        .body {
          font-size: ${toString font.size.big};
          font-weight: 400;
          background: transparent;
          color: ${base05};
          text-shadow: none
        }
        .control-center {
          background: ${base00};
          border: ${toString borderWidth} solid ${base0C};
          border-radius: ${toString cornerRadius};
        }
        .control-center-list {
          background: transparent
        }
        .control-center-list-placeholder {
          opacity: .5
        }
        .floating-notifications {
          background: transparent
        }
        .blank-window {
          background: alpha(black, 0)
        }
        .widget-title {
          color: ${base0B};
          background: ${base00};
          padding: 5px 10px;
          margin: 10px 10px 5px 10px;
          font-size: 1.5rem;
          border-radius: 5px;
        }
        .widget-title>button {
          font-size: 1rem;
          color: ${base05};
          text-shadow: none;
          background: ${base00};
          box-shadow: none;
          border-radius: 5px;
        }
        .widget-title>button:hover {
          background: ${base08};
          color: ${base00};
        }
        .widget-dnd {
          background: ${base00};
          padding: 5px 10px;
          margin: 10px 10px 5px 10px;
          border-radius: 5px;
          font-size: large;
          color: ${base0B};
        }
        .widget-dnd>switch {
          border-radius: 5px;
          /* border: 1px solid ${base0B}; */
          background: ${base0B};
        }
        .widget-dnd>switch:checked {
          background: ${base08};
          border: 1px solid ${base08};
        }
        .widget-dnd>switch slider {
          background: ${base00};
          border-radius: 5px
        }
        .widget-dnd>switch:checked slider {
          background: ${base00};
          border-radius: 5px
        }
        .widget-label {
            margin: 10px 10px 5px 10px;
        }
        .widget-label>label {
          font-size: 1rem;
          color: ${base05};
        }
        .widget-mpris {
          color: ${base05};
          padding: 5px 10px;
          margin: 10px 10px 5px 10px;
          border-radius: 5px;
        }
        .widget-mpris > box > button {
          border-radius: 5px;
        }
        .widget-mpris-player {
          padding: 5px 10px;
          margin: 10px
        }
	.widget-mpris-album-art {
	  background: none;
	  min-width: 60px;
	  min-height: 60px;
	  border-radius: 16px;
	  margin-right: 12px;
	}
        .widget-mpris-title {
          font-weight: 700;
          font-size: 1.25rem
        }
        .widget-mpris-subtitle {
          font-size: 1.1rem
        }
        .widget-menubar>box>.menu-button-bar>button {
          border: none;
          background: transparent
        }
        .topbar-buttons>button {
          border: none;
          background: transparent
        }
        .widget-volume {
          background: ${base01};
          padding: 5px;
          margin: 10px 10px 5px 10px;
          border-radius: 5px;
          font-size: x-large;
          color: ${base05};
        }
        .widget-volume>box>button {
          background: ${base0B};
          border: none
        }
        .per-app-volume {
          background-color: ${base00};
          padding: 4px 8px 8px;
          margin: 0 8px 8px;
          border-radius: 5px;
        }
        .widget-backlight {
          background: ${base01};
          padding: 5px;
          margin: 10px 10px 5px 10px;
          border-radius: 5px;
          font-size: x-large;
          color: ${base05}
        }
      '';
    };
  }];
}
