{
  flake.modules.nixos.core = {
    # timezone / locale
    time.timeZone = "America/New_York";
    i18n.defaultLocale = "en_US.UTF-8";

    # LVS (fwupd)
    services.fwupd.enable = true;

    boot.tmp.cleanOnBoot = true;
  };
}
