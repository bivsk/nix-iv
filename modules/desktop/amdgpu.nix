{ config, lib, pkgs, ... }: let
  inherit (lib) enabled merge mkIf;
in merge <| mkIf config.isDesktop {
  hardware = {
    graphics = enabled {
      extraPackages = [ pkgs.rocmPackages.clr.icd ];
    };
  };

  environment.systemPackages = with pkgs; [
    clinfo
    lact
    nvtopPackages.amd
  ];

  systemd.packages = pkgs.lact;
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}
