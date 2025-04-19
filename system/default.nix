let
  desktop = [
    ./core
    ./core/boot.nix

    ./hardware/bluetooth.nix
    ./hardware/crypto.nix
    ./hardware/fwupd.nix
    ./hardware/graphics.nix

    ./network

    ./programs
    ./programs/gnome.nix

    ./services
    ./services/pipewire.nix
  ];

  laptop = 
    desktop
    ++ [
      ./services/backlight.nix
      ./services/power.nix
    ];
in {
  inherit desktop laptop;
}
