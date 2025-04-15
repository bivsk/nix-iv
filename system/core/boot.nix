{ pkgs, config, ... }:
{
  boot = {
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

    # TODO: move out of boot?
    supportedFilesystems = [ "zfs" ];
  }; 
}
