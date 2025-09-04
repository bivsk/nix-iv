{
  flake.modules.nixos.core = {
    # timezone / locale
    time.timeZone = "America/New_York";
    i18n.defaultLocale = "en_US.UTF-8";

    boot.tmp.cleanOnBoot = true;
  };
}
