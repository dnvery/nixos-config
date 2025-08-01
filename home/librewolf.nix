{ pkgs, ... }:
{
  programs.librewolf = {
    enable = true;
    policies = {
      # BlockAboutConfig = true;
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };
    
    settings = {
      "layout.css.devPixelsPerPx" = "1.8";
      "browser.translations.enable" = false;
      "media.videocontrols.picture-in-picture.video-toggle.has-used" = true;
      # "sidebar.verticalTabs" = true;
      # "sidebar.visibility" = "expand-on-hover";
    };

    profiles.default = {
      search = {
        force = true;
        engines = {
          nix-packages = {
            name = "Nix Packages";
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@nw" ];
          };

          home-manager-options = {
            name = "Home Manager Options";
            urls = [{
              template = "https://home-manager-options.extranix.com";
              params = [
                { name = "release"; value = "master"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@hm" ];
          };
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