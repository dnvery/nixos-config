{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        variant = "mocha";
      };
    };
    #iconTheme = {
    #  name = "Papirus-Dark";
    #  package = pkgs.catppuccin-papirus-folders.override {
    #    flavor = "mocha";
    #    accent = "lavender";
    #  };
    #};
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
    cursorTheme = {
      #name = "Nordzy-cursors";
      #package = pkgs.nordzy-cursor-theme;
      name = "macOS-Monterey";
      package = pkgs.apple-cursor;
      size = 20;
    };
  };

  home.pointerCursor = {
    name = "macOS-Monterey";
    package = pkgs.apple-cursor;
    size = 20;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
}
