{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) enabled merge mkIf;
in
merge
<| mkIf config.isDesktop {
  boot = {
    initrd.systemd = enabled;
    plymouth = enabled {
      theme = "pixels";
      themePackages = [
        (pkgs.adi1090x-plymouth-themes.override {
          selected_themes = [ "pixels" ];
        })
      ];
    };

    # enable "silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    loader.timeout = 0;
  };
}
