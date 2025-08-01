{ config, pkgs, ... }:

{
  imports = [
    ./gtk.nix
    ./git.nix
    ./vscodium.nix
    ./kitty.nix
    ./cava.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpanel.nix
    ./zsh.nix
    ./librewolf.nix
    ./udiskie.nix
    ./syncthing.nix
    ./rofi.nix
    ./clock-rs.nix
    ./zathura.nix
  ];

  # home.pointerCursor = {
  #   enable = true;
  #   name = "macOS";
  #   size = 16;
  #   package = pkgs.apple-cursor;
  #   hyprcursor.enable = true;
  #   gtk.enable = true;
  #   x11.enable = true;
  # };

  home.pointerCursor = {
    enable = true;
    hyprcursor.enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  services.swww.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "daniil";
  home.homeDirectory = "/home/daniil";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
