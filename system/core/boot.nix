{ pkgs, config, ... }:
{
  boot = {
    bootspec.enable = true;

    initrd = {
      systemd.enable = true;
    };

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
      "plymouth.use-simpledrm"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    plymouth.enable = true;

    # # TODO: move out of boot?
    supportedFilesystems = [ "zfs" ];
  }; 
  networking.hostId = "00bab10c";
}
