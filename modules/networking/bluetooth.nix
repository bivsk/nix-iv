{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      services.blueman.enable = true;
      environment.systemPackages = [ pkgs.bluetui ];
      hardware.bluetooth = {
        enable = true;
        package = pkgs.bluez-experimental;
        powerOnBoot = true;
        settings.General.Experimental = true;
      };
    };
}
