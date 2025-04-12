{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../system
    ];

  # Bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      #efiSysMountPoint = "/boot/efi";
    };
    systemd-boot.enable = true;
  };

  # Enable networking
  networking.hostName = "robin"; # Define your hostname.
  networking.networkmanager.enable = true;

}
