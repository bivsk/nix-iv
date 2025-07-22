{ config, ... }:
{
  flake.modules.homeManager.hyprland =
    {
      lib,
      pkgs,
      ...
    }:
    {
      imports = with config.flake.modules.homeManager; [
        waybar
        wayland
      ];

      xdg.portal = {
        enable = true;
        config.common.default = "*";

        extraPortals = [
          pkgs.xdg-desktop-portal-hyprland
        ];

        configPackages = [
          pkgs.hyprland
        ];
      };

      home.packages = lib.attrValues {
        inherit (pkgs)
          brightnessctl
          grim
          hyprpicker
          slurp
          swappy
          swaybg
          wl-clipboard
          wtype
          xdg-utils
          ;
      };

      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false; # conflicts with UWSM

        settings = {
          monitor = lib.mkDefault [ ", highrr, auto, 1, vrr, 3" ];

          xwayland = {
            enabled = true;
            force_zero_scaling = true;
          };

          env = [
            "GDK_BACKEND,wayland,x11,*"
            "QT_QPA_PLATFORM,wayland;xcb"
            "SDL_VIDEODRIVER,wayland"
            "CLUTTER_BACKEND,wayland"
            "NIXOS_OZONE_WL,1"
          ];

          bindle = [
            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1.25"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ", XF86MonBrightnessUp, exec, brillo -A 5"
            ", XF86MonBrightnessDown, exec, brillo -U 5"
          ];

          bindl = [
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ];

          bindm = [
            "SUPER, mouse:272, movewindow"
            "SUPER, mouse:274, movewindow"
            "SUPER, mouse:273, resizewindow"
          ];

          binde = [
            "SUPER, left, movefocus, l"
            "SUPER, down, movefocus, d"
            "SUPER, up, movefocus, u"
            "SUPER, right, movefocus, r"

            "SUPER, H, movefocus, l"
            "SUPER, J, movefocus, d"
            "SUPER, K, movefocus, u"
            "SUPER, L, movefocus, r"

            "SUPER+CTRL, left, resizeactive, -100 0"
            "SUPER+CTRL, down, resizeactive, 0 100"
            "SUPER+CTRL, up, resizeactive, 0 -100"
            "SUPER+CTRL, right, resizeactive, 100 0"

            "SUPER+CTRL, H, resizeactive, -100 0"
            "SUPER+CTRL, J, resizeactive, 0 100"
            "SUPER+CTRL, K, resizeactive, 0 -100"
            "SUPER+CTRL, L, resizeactive, 100 0"
          ];

          bind = lib.flatten [
            "SUPER, TAB, workspace, e+1"
            "SUPER+SHIFT, TAB, workspace, e-1"

            "SUPER, mouse_up, workspace, e+1"
            "SUPER, mouse_down, workspace, e-1"

            (
              map (n: [
                "SUPER, ${toString n}, workspace, ${toString n}"
                "SUPER+SHIFT, ${toString n}, movetoworkspacesilent, ${toString n}"
              ])
              <| lib.range 1 9
            )
            "SUPER, 0, workspace, 10"
            "SUPER+SHIFT, 0, movetoworkspacesilent, 10"

            "SUPER+SHIFT, left, movewindow, l"
            "SUPER+SHIFT, down, movewindow, d"
            "SUPER+SHIFT, up, movewindow, u"
            "SUPER+SHIFT, right, movewindow, r"

            "SUPER+SHIFT, H, movewindow, l"
            "SUPER+SHIFT, J, movewindow, d"
            "SUPER+SHIFT, K, movewindow, u"
            "SUPER+SHIFT, L, movewindow, r"

            "SUPER, F, fullscreen"
            "SUPER+SHIFT, F, togglefloating"
            "SUPER+SHIFT, C, killactive"
            "SUPER+SHIFT, Q, exit"

            "SUPER+SHIFT, RETURN, exec, ghostty"
            "SUPER, W, exec, firefox"
            "SUPER, D, exec, discord"

            ", PRINT, exec, pkill grim; grim -g \"$(slurp -w 0)\" - | swappy -f - -o - | wl-copy --type image/png"
            "SHIFT, PRINT, exec, pkill grim; grim - | swappy -f - -o - | wl-copy --type image/png"
          ];

          general = {
            gaps_in = 4;
            gaps_out = 8;
            border_size = 2;
            resize_on_border = true;
          };

          decoration = {
            rounding = 5;
            blur = {
              enabled = true;
              size = 8;
              passes = 3;
              new_optimizations = true;
              xray = false; # dependent on above, decreases overhead
              special = false; # expensive
            };
          };

          input = {
            follow_mouse = 1;

            repeat_delay = 400;
            repeat_rate = 30;

            kb_layout = "us";
            kb_options = "ctrl:nocaps";

            numlock_by_default = true;

            touchpad = {
              clickfinger_behavior = true;
              drag_lock = true;
              natural_scroll = true;
              scroll_factor = 0.7;
            };
          };

          gestures.workspace_swipe = true;

          animations = {
            bezier = [ "material_decelerate, 0.05, 0.7, 0.1, 1" ];

            animation = [
              "border    , 1, 2, material_decelerate"
              "fade      , 1, 2, material_decelerate"
              "layers    , 1, 2, material_decelerate"
              "windows   , 1, 2, material_decelerate, popin 80%"
              "workspaces, 1, 2, material_decelerate"
            ];
          };

          misc = {
            animate_manual_resizes = true;

            disable_hyprland_logo = true;
            disable_splash_rendering = true;

            key_press_enables_dpms = true;
            mouse_move_enables_dpms = true;
          };

          cursor = {
            hide_on_key_press = true;
            inactive_timeout = 10;
            no_warps = true;
          };

          dwindle = {
            preserve_split = true;
            smart_resizing = true;
          };

          ecosystem = {
            no_update_news = true;
            no_donation_nag = true;
            enforce_permissions = false;
          };
        };
      };
    };
}
