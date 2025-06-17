{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) attrValues enabled merge mkIf;
in
  merge
  <| mkIf config.isDesktop {
    security.rtkit = enabled;

    services.pipewire = enabled {
      alsa = enabled {support32Bit = true;};
      pulse = enabled;
    };

    home-manager.sharedModules = [
      {
        home.packages = attrValues {
          inherit
            (pkgs)
            pulsemixer
            pwvucontrol
            ;
        };
      }
    ];
  }
