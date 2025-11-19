{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        # Float and center file pickers
        "float, class:xdg-desktop-portal-gtk, title:^(Open.*Files?|Save.*Files?|All Files|Save)"
        "center, class:xdg-desktop-portal-gtk, title:^(Open.*Files?|Save.*Files?|All Files|Save)"
        "float, title:^(File Upload)"
        "center, title:^(File Upload)"

        # Float Steam, fullscreen RetroArch
        "float, class:^(steam)$"
        "fullscreen, class:^(com.libretro.RetroArch)$"

        # Float and center blueman
        "float, title:^(Bluetooth Devices)"
        "center, title:^(Bluetooth Devices)"
        "size (monitor_h*0.5) (monitor_w*0.5), title:^(Bluetooth Devices)"

        # Rabby Wallet
        "float, class:chrome-acmacodkjbdgmoleebolmdjonilkdbch-Default"
        "center, class:chrome-acmacodkjbdgmoleebolmdjonilkdbch-Default"

        # Opacity
        "opacity 0.97 0.9, class:.*"
        "opacity 1 0.97, class:^(Chromium|chromium|google-chrome|firefox|qutebrowser|brave-browser|google-chrome-unstable)$"
        "opacity 1 1, initialTitle:^(youtube.com_/)$"
        "opacity 1 1, class:^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|imv|org.gnome.NautilusPreviewer)$"
        "opacity 1 1, class:^(com.libretro.RetroArch|steam)$"
      ];
    };
  };
}
