{
  flake.modules.homeManager.hyprland =
    { lib, ... }:
    {
      wayland.windowManager.hyprland.settings = {

        # l -> locked, will also work when an input inhibitor (e.g. a lockscreen) is active.
        # r -> release, will trigger on release of a key.
        # c -> click, will trigger on release of a key or button as long as the mouse cursor stays inside binds:drag_threshold.
        # g -> drag, will trigger on release of a key or button as long as the mouse cursor moves outside binds:drag_threshold.
        # o -> longPress, will trigger on long press of a key.
        # e -> repeat, will repeat when held.
        # n -> non-consuming, key/mouse events will be passed to the active window in addition to triggering the dispatcher.
        # m -> mouse, see below.
        # t -> transparent, cannot be shadowed by other binds.
        # i -> ignore mods, will ignore modifiers.
        # s -> separate, will arbitrarily combine keys between each mod/key, see [Keysym combos](#keysym-combos) above.
        # d -> has description, will allow you to write a description for your bind.
        # p -> bypasses the app's requests to inhibit keybinds.

        "$mod" = "SUPER";
        "$terminal" = "uwsm app -- ghostty";
        "$browser" = "uwsm app -- brave --new-window";
        "$webapp" = "$browser --app";

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:274, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

        binde = [
          "$mod, left, movefocus, l"
          "$mod, down, movefocus, d"
          "$mod, up, movefocus, u"
          "$mod, right, movefocus, r"

          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, r"

          "$mod+CTRL, left, resizeactive, -100 0"
          "$mod+CTRL, down, resizeactive, 0 100"
          "$mod+CTRL, up, resizeactive, 0 -100"
          "$mod+CTRL, right, resizeactive, 100 0"

          "$mod+CTRL, H, resizeactive, -100 0"
          "$mod+CTRL, J, resizeactive, 0 100"
          "$mod+CTRL, K, resizeactive, 0 -100"
          "$mod+CTRL, L, resizeactive, 100 0"
        ];

        bind = lib.flatten [
          "$mod, TAB, workspace, e+1"
          "$mod+SHIFT, TAB, workspace, e-1"

          "$mod, mouse_up, workspace, e+1"
          "$mod, mouse_down, workspace, e-1"

          (
            map (n: [
              "$mod, ${toString n}, workspace, ${toString n}"
              "$mod+SHIFT, ${toString n}, movetoworkspacesilent, ${toString n}"
            ])
            <| lib.range 1 9
          )
          "$mod, 0, workspace, 10"
          "$mod+SHIFT, 0, movetoworkspacesilent, 10"

          "$mod+SHIFT, left, movewindow, l"
          "$mod+SHIFT, down, movewindow, d"
          "$mod+SHIFT, up, movewindow, u"
          "$mod+SHIFT, right, movewindow, r"

          "$mod+SHIFT, H, movewindow, l"
          "$mod+SHIFT, J, movewindow, d"
          "$mod+SHIFT, K, movewindow, u"
          "$mod+SHIFT, L, movewindow, r"

          "$mod, F, fullscreen"
          "$mod+SHIFT, F, togglefloating"
          "$mod+SHIFT, C, killactive"
          "$mod+SHIFT, Q, exit"

          "$mod+SHIFT, RETURN, exec, $terminal"
          "$mod, W, exec, $browser"
          "$mod, D, exec, discord"

          # TODO: look into moving apps to key chords?
          # tui
          "$mod, y, exec, $terminal -e yazi"

          # web apps
          "$mod+CTRL, C, exec, $webapp=\"https://chatgpt.com\""
          "$mod+CTRL, G, exec, $webapp=\"https://grok.com\""
          "$mod+CTRL, X, exec, $webapp=\"https://x.com\""
          "$mod+CTRL, Y, exec, $webapp=\"https://youtube.com\""
          "$mod+CTRL, T, exec, $webapp=\"https://tv.youtube.com\""
          "$mod+CTRL, N, exec, $webapp=\"https://netflix.com\""
          "$mod+CTRL, M, exec, $webapp=\"https://messages.google.com/web/conversations\""

          ", PRINT, exec, pkill grim; grim -g \"$(slurp -w 0)\" - | swappy -f - -o - | wl-copy --type image/png"
          "SHIFT, PRINT, exec, pkill grim; grim - | swappy -f - -o - | wl-copy --type image/png"
        ];
      };
    };
}
