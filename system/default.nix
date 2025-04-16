# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./core
    ./desktop
    ./network
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes and nix cli
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/four/nix/config";
  };

  # Set default editor
  environment.variables.EDITOR = "vim";

  networking.hostId = "9b6d17a4";
}
