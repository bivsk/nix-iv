{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../system
    ];

  # Enable networking
  networking.hostName = "robin"; # TODO: use var
  networking.networkmanager.enable = true;
}
