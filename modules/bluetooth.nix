{
  flake.modules.nixos.pc =
    { pkgs, ... }:
    {
      hardware.bluetooth = {
        enable = true;
        package = pkgs.bluez-experimental;
        powerOnBoot = true;
        settings.General.Experimental = true;
      };

      # UI
      environment.systemPackages = with pkgs; [ bluetui ]; # tui
      services.blueman.enable = true; # gui
    };
}
