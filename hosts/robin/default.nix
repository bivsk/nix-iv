{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Enable networking
  networking.hostName = "robin"; # TODO: use var
}
