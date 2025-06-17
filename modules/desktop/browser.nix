{
  config,
  lib,
  ...
}:
let
  inherit (lib) enabled merge mkIf;
in
merge
<| mkIf config.isDesktop {
  programs.firefox = enabled {
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      ExtensionSettings = {
        # Rabby Wallet
        "{743634b5-5b80-4035-a92b-e6aac3fc32ed}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/{743634b5-5b80-4035-a92b-e6aac3fc32ed}/latest.xpi";
        };
      };
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggestions = false;
        Locked = true;
      };
      HttpsOnlyMode = "enabled";
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      PromptForDownloadLocation = true;
      SearchSuggestEnabled = false;
    };
  };
}
