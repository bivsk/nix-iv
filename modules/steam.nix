{ config, pkgs, lib, ... }: let
  inherit (lib) attrValues enabled merge mkIf;
in merge <| mkIf config.isDesktop {
  hardware.graphics.enable32Bit = true;
  programs.gamescope = enabled {
    capSysNice = true;
    args = [
      "--rt"
      "--expose-wayland"
    ];
  };

  programs.steam = enabled {
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession = enabled;
  };
}
