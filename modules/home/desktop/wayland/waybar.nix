let
  flake.modules.homeManager.waybar.imports = [
    waybar
    hyprland
  ];
  hyprland = {
    wayland.windowManager.hyprland.settings = {
      exec = [ "pkill --signal SIGUSR2 waybar" ];
      bind = [ "SUPER, B, exec, pkill --signal SIGUSR1 waybar" ];
    };
  };

  waybar =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      # use custom theming
      stylix.targets.waybar.enable = false;

      # japanese comic sans
      home.packages = [ pkgs.azuki ];

      programs.waybar = {
        enable = true;
        systemd.enable = true;

        settings = [
          {
            layer = "top";
            height = 8;
            margin-right = 8;
            margin-left = 8;
            margin-top = 8;

            modules-left = [ "hyprland/workspaces" ];

            "hyprland/workspaces" = {
              format = "{icon}";
              format-icons = {
                "1" = "一";
                "2" = "二";
                "3" = "三";
                "4" = "四";
                "5" = "五";
                "6" = "六";
                "7" = "七";
                "8" = "八";
                "9" = "九";
                "10" = "十";
              };
              # format-icons.default = "";
              # format-icons.active = "";

              persistent-workspaces."*" = 4;
            };

            modules-center = [ "hyprland/window" ];

            "hyprland/window" = {
              separate-outputs = true;

              rewrite."(.*) - Discord" = "󰙯 $1";
              rewrite."(.*) — Mozilla Firefox" = "󰖟 $1";
              rewrite."(.*) — Zen" = "󰖟 $1";
              rewrite."(.*) — nu" = " $1";
            };

            modules-right = [
              "tray"
              "pulseaudio"
              "cpu"
              "memory"
              "network"
              "backlight"
              "battery"
              "clock"
            ];

            tray = {
              reverse-direction = true;
              spacing = 5;
            };

            pulseaudio = {
              format = "{icon} {volume}%";
              format-muted = "{format_source} 󰸈";

              format-bluetooth = "󰋋 󰂯 {volume}%";
              format-bluetooth-muted = "󰟎 󰂯";

              # format-source       = "󰍬";
              # format-source-muted = "󰍭";

              format-icons.default = [
                "󰕿"
                "󰖀"
                "󰕾"
              ];
            };

            backlight = {
              format = "{icon} {percent}%";
              format-icons = [
                ""
                ""
                ""
                ""
                ""
                ""
                ""
                ""
                ""
              ];
            };

            cpu.format = " {usage}%";
            memory.format = "  {}%";

            network = {
              format-disconnected = " ";
              format-ethernet = " {ipaddr}/{cidr}";
              format-wifi = " {signalStrength}%";
            };

            battery = {
              format = "{icon} {capacity}%";
              format-charging = "󰂄 {capacity}%";
              format-plugged = "󰂄 {capacity}%";

              format-icons = [
                "󰁺"
                "󰁻"
                "󰁼"
                "󰁽"
                "󰁾"
                "󰁿"
                "󰂀"
                "󰂁"
                "󰂂"
                "󰁹"
              ];

              states.warning = 30;
              states.critical = 15;
            };

            clock.tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          }
        ];

        style =
          with config.lib.stylix.colors.withHashtag;
          # css
          ''
            	    * {
            	      border: none;
            	      border-radius: 4px;
            	      font-family: "${config.stylix.fonts.monospace.name}";
            	    }

            	    .modules-right {
            	      margin-right: 8px;
            	    }

            	    #waybar {
            	      background: ${base00};
            	      color: ${base05};
            	    }

            	    #workspaces button:nth-child(1)  { color: ${base08}; }
            	    #workspaces button:nth-child(2)  { color: ${base09}; }
            	    #workspaces button:nth-child(3)  { color: ${base0A}; }
            	    #workspaces button:nth-child(4)  { color: ${base0B}; }
            	    #workspaces button:nth-child(5)  { color: ${base0C}; }
            	    #workspaces button:nth-child(6)  { color: ${base0D}; }
            	    #workspaces button:nth-child(7)  { color: ${base0E}; }
            	    #workspaces button:nth-child(8)  { color: ${base0F}; }
            	    #workspaces button:nth-child(9)  { color: ${base04}; }
            	    #workspaces button:nth-child(10) { color: ${base06}; }

            	    #workspaces label {
            	      font-family: "azukifontLB";
            	    }

            	    #workspaces button.empty {
            	      color: ${base02};
            	    }

            	    #tray, #pulseaudio, #backlight, #cpu, #memory, #network, #battery, #clock {
            	      margin-left: 20px;
            	    }

            	    @keyframes blink {
            	      to {
            	        color: ${base05};
            	      }
            	    }

            	    #battery.critical:not(.charging) {
            	      animation-direction: alternate;
            	      animation-duration: 0.5s;
            	      animation-iteration-count: infinite;
            	      animation-name: blink;
            	      animation-timing-function: linear;
            	      color: ${base08};
            	    }
            	  '';
      };
    };
in
{
  nixpkgs.allowedUnfreePackages = [ "azuki" ];
  inherit flake;
}
