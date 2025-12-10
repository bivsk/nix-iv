{
  flake.modules.homeManager.swayosd =
    { pkgs, ... }:
    let
      inherit (pkgs) fetchFromGitHub;
      inherit (pkgs.rustPackages.rustPlatform) fetchCargoVendor;
    in
    {
      services.swayosd.enable = true;
      # testing latest git version since 0.2.1 keeps coredumping
      services.swayosd.package = pkgs.swayosd.overrideAttrs (old: rec {
        version = "git-master-2025.12.10";
        src = fetchFromGitHub {
          owner = "ErikReider";
          repo = "SwayOSD";
          rev = "master";
          hash = "sha256-G5teRSjrilJmdKyzUEYD5DUt91cPxkLJPoP+sK/OFEo=";
        };
        cargoDeps = fetchCargoVendor {
          inherit (old) pname;
          inherit src version;
          hash = "sha256-t0IZvO7Wbx6A7v/sRZOSOLj0O/1m7vOBjZSd99TAutI=";
        };
        cargoBuildType = "debug";
        dontStrip = true;
        separateDebugInfo = true;
        env.RUST_BACKTRACE = "full";
      });

      # configure hyprland keybinds
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
