{ config, lib, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # steam remote play
    localNetworkGameTransfers.openFirewall = true; # lan game transfers

    # gamescope
    gamescopeSession.enable = true;

    # drivers
    # TODO: install host-specific drivers
  };
  hardware = {
    graphics = {
      enable = lib.mkForce true;
      enable32Bit = lib.mkForce true;
    };

    amdgpu.amdvlk = {
      enable = lib.mkForce true;
      support32Bit.enable = lib.mkForce true;
    };
  };
}
