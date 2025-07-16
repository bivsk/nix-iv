{
  flake.modules.nixos.core = {
    # Set your time zone.
    time.timeZone = "America/New_York";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    console.font = "Lat2-Terminus16";

    # LVS (fwupd)
    services.fwupd.enable = true;

    boot.tmp.cleanOnBoot = true;
  };
}
