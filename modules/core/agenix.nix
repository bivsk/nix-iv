{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) attrNames attrValues head mkAliasOptionModule mkIf;
in {
  imports = [(mkAliasOptionModule ["secrets"] ["age" "secrets"])];

  age.identityPaths = ["/root/.ssh/id"];

  environment = mkIf config.isDesktop {
    shellAliases.agenix = "agenix --identity ~/.ssh/id";
    systemPackages = attrValues {
      inherit
        (pkgs)
        agenix
        ;
    };
  };
}
