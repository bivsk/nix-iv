{
  flake.modules.nixos.pc =
    { pkgs, ... }:
    {
      # https://github.com/danth/stylix/discussions/1206
      # stylix.targets.grub.enable = false;

      boot = {
        initrd.systemd.enable = true;
        kernelParams = [
          "quiet"
          "splash"
          "boot.shell_on_fail"
          "udev.log_priority=3"
          "systemd.show_status=auto"
        ];
        plymouth = {
          enable = true;
          theme = "pixels";
          themePackages = [
            (pkgs.adi1090x-plymouth-themes.override {
              selected_themes = [ "pixels" ];
            })
          ];
        };
      };
    };
}
