{ config, pkgs, ... }:

{
  imports = [
    ./noctalia.nix
    ./theming.nix
    ./syncthing.nix
    ./librewolf.nix
    ./hyprland.nix
    ./kitty.nix
    ./zsh.nix
    ./cava.nix
    ./vscodium.nix
    ./obsidian.nix
    ./ncmpcpp.nix
  ];

  home.username = "daniil";
  home.homeDirectory = "/home/daniil";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "dnvery";
        email = "dnffx@protonmail.com";
      };
    };
  };

  home.packages = with pkgs; [
    grimblast
  ];

  home.file."Pictures/Screenshots/.keep".text = "";

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";
}
