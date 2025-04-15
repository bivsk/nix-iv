{ pkgs, ... }: 
{
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez-experimental;
    settings = {
      General = {
        # Battery info for Bluetooth devices
        Experimental = true;
      };
    };
  };

  # https://github.com/NixOS/nixpkgs/issues/114222
  systemd.user.services.telephony_client.enable = false;
}
