{ config, lib, ... }: let
  inherit (lib) mkConst mkValue;
in {
  options = {
    type = mkValue "server";

    isDesktop = mkConst <| config.type != "server";
    isLaptop = mkConst <| config.type == "laptop";
    isServer = mkConst <| config.type == "server";
  };
}
