{
  config,
  lib,
  ...
}: let
  inherit (lib) enabled merge mkIf;
in
  merge
  <| mkIf config.isDesktop {
    programs.seahorse = enabled;

    security.pam.services.login.enableGnomeKeyring = true;

    services.gnome.gnome-keyring = enabled;
  }
