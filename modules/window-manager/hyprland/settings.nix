{ lib, ... }:
let
  inherit (lib) flatten range;
in
{
  flake.modules.homeManager.gui = {
    wayland.windowManager.hyprland = {
      enable = true;

      systemd = {
        enable = true;
        enableXdgAutostart = true;
      };

      settings = {
        # TODO: make this host-specific
        monitor = [ ", highrr, auto, 1, vrr, 3" ];

        env = [
          "GDK_BACKEND,wayland,x11,*"
          "QT_QPA_PLATFORM,wayland;xcb"
          "SDL_VIDEODRIVER,wayland"
          "CLUTTER_BACKEND,wayland"
          "NIXOS_OZONE_WL,1"
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

        bind = flatten [
          "SUPER, TAB, workspace, e+1"
          "SUPER+SHIFT, TAB, workspace, e-1"

          "SUPER, mouse_up, workspace, e+1"
          "SUPER, mouse_down, workspace, e-1"

          (
            map (n: [
              "SUPER, ${toString n}, workspace, ${toString n}"
              "SUPER+SHIFT, ${toString n}, movetoworkspacesilent, ${toString n}"
            ])
            <| range 1 9
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
        ];

        general = {
          # gaps_in =
          # gaps_out =
          # border_size =

          # "col.active_border" = "0xFF${base0A}";
          # "col.nogroup_border_active" = "0xFF${base0A}";
          #
          # "col.inactive_border" = "0xFF${base01}";
          # "col.nogroup_border" = "0xFF${base01}";

          resize_on_border = true;
        };

        decoration = {
          # rounding = ;

          blur = {
            enabled = true;
            size = 8;
            passes = 3;
            new_optimizations = true;
            xray = false; # dependent on above; decreases overhead
            special = false; # expensive
          };
        };

        xwayland.force_zero_scaling = true;

        input.numlock_by_default = true;

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

        ecosystem = {
          no_update_news = true;
          no_donation_nag = true;
        };

        misc = {
          animate_manual_resizes = true;

          # background_color = #;
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
          smart_resizing = false;
        };
      };
    };
  };
}
