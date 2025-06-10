{ config, lib, pkgs, ... }: let
  inherit (lib) attrValues enabled merge mkIf;
in merge <| mkIf config.isDesktop {
  hardware = {
    graphics = enabled {
      extraPackages = [ pkgs.rocmPackages.clr.icd ];
    };
  };

  environment.systemPackages = attrValues <| {
    inherit (pkgs)
      clinfo
      nvtopPackages.amd
    ;
  };
}
