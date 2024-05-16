{
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableProfileImport = true;
      NoDefaultBookmarks = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      Preferences = {
        "datareporting.policy.firstRunURL" = "";
        "browser.display.use_document_fonts" = 0;
        "browser.translations.automaticallyPopup" = false;
      };
      ExtensionSettings = {
        #"*".installation_mode = "blocked";

        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };

        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };

    home.file.".mozilla/managed-storage/uBlock0@raymondhill.net.json".text =
    builtins.toJSON {
      name = "uBlock0@raymondhill.net";
      description = "_";
      type = "storage";
      data = {
        adminSettings = {
          userFilters = ''
            ||accounts.google.com/gsi/iframe/select$subdocument
          '';
        };
        toOverwrite = {
          filterLists = [
            "user-filters"
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-abuse"
            "ublock-unbreak"
            "easylist"
            "easyprivacy"
            "urlhaus-1"
            "plowe-0"
            "https://filters.adtidy.org/extension/ublock/filters/1.txt"
            "https://easylist-downloads.adblockplus.org/cntblock.txt"
            "https://easylist-downloads.adblockplus.org/bitblock.txt"
          ];
        };
      };
    };
}
