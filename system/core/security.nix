{
  security = {
    # allow wayland lockscreens to unlock the screen
    pam.services.hyprlock.text = "auth include login";

    # userland niceness
    rtkit.enable = true;
  };
}
