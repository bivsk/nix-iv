{ inputs, ... }:
let
  flake.modules.nixos.gaming.imports = [
    gamescope
    mangohud
    steam
  ];

  gamescope = {
    programs.gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };
  };

  mangohud =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.mangohud
      ];
    };

  steam = {
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
    };
  };
in
{
  nixpkgs.allowedUnfreePackages = [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];
  inherit flake;
}
