{ lib, ... }:
let 
  locale = "en_US.UTF-8";
  tz = "America/New_York";
in 
{

  imports = [
    ./security.nix
    ./users.nix
    ./virt.nix
    ../nix
  ];

  documentation.dev.enable = true;

  # Set your time zone.
  time.timeZone = lib.mkDefault tz;

  # Select internationalisation properties.
  i18n.defaultLocale = locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
  };

  system.stateVersion = lib.mkDefault "24.11";
}
