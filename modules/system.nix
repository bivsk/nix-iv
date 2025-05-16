{ config, lib, ... }: let
  inherit (lib) mkConst mkValue;
in {
  options = {
    type = mkValue "server";

    isDesktop = mkConst <| config.type == "desktop";
    isServer = mkConst <| config.type == "server";
  };
}
