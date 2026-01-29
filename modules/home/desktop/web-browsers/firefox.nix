{
  flake.modules.homeManager.firefox = {
    programs.firefox = {
      enable = true;
      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DefaultDownloadDirectory = "~/Downloads";
        DisableBuiltinPDFViewer = true;
        DisableMasterPasswordCreation = true;
        DisablePocket = true;
        DisableSetDesktopBackground = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        ExtensionSettings = {
          # Bitwarden
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/{446900e4-71c2-419f-a6a7-df9c091e268b}/latest.xpi";
          };
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
          # Vimium
          "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/{d7742d87-e61d-4b78-b8a1-b469842139fa}/latest.xpi";
          };
        };
        FirefoxHome = {
          SponsoredTopSites = false;
          Highlights = false;
          Pocket = false;
          SponsoredPocket = false;
          Snippets = false;
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
          userChrome = "";
          userContent = "";
        };
        vpn = {
          id = 1;
        };
      };
    };

    stylix.targets.firefox.profileNames = [ "primary" ];
  };
}
