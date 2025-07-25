{
  flake.modules.homeManager.swayosd = {
    services.swayosd.enable = true;

    wayland.windowManager.hyprland.settings = {
      "$osdclient" =
        "swayosd-client --monitor \"$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')\"";

      bindle = [
        ", XF86AudioRaiseVolume, exec, $osdclient --output-volume raise"
        ", XF86AudioLowerVolume, exec, $osdclient --output-volume lower"
        ", XF86AudioMute, exec, $osdclient --output-volume mute-toggle"
        ", XF86AudioMicMute, exec, $osdclient --input-volume mute-toggle"
        ", XF86MonBrightnessUp, exec, $osdclient --brightness raise"
        ", XF86MonBrightnessDown, exec, $osdclient --brightness lower"
      ];
      bindl = [
        ", XF86AudioNext, exec, $osdclient --playerctl next"
        ", XF86AudioPause, exec, $osdclient --playerctl play-pause"
        ", XF86AudioPlay, exec, $osdclient --playerctl play-pause"
        ", XF86AudioPrev, exec, $osdclient --playerctl previous"
      ];
    };
  };
}
