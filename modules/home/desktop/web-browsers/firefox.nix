{
  flake.modules.homeManager.firefox = {
    programs.firefox = {
      enable = true;
      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisablePocket = true;
        DisableSetDesktopBackground = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        ExtensionSettings = {
          # Metamask
          "webextension@metamask.io" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/webextension@metamask.io/latest.xpi";
          };
          # uBlock Origin
          "uBlock0@raymondhill.net" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/uBlock0@raymondhill.net/latest.xpi";
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
      profiles = {
        primary = {
          id = 0;
          settings."toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          settings."browser.ctrlTab.sortByRecentlyUsed" = true;
          settings."browser.tabs.closeWindowWithLastTab" = false;
          userChrome = '''';
          userContent = '''';
        };
        vpn = {
          id = 1;
        };
      };
    };

    stylix.targets.firefox.profileNames = [ "primary" ];
  };
}
