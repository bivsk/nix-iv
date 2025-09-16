{
  flake.modules.nixos.bluetooth =
    { pkgs, ... }:
    {
      services.blueman.enable = true;

      hardware.bluetooth = {
        enable = true;
        package = pkgs.bluez-experimental;
        powerOnBoot = true;
        settings.General.Experimental = true;
      };

      environment.persistence."/persist".directories = [
        "/var/lib/bluetooth"
      ];
    };
}
