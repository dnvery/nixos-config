{ config, lib, pkgs, pkgs-master, pkgs-stable, pkgs-dnvery, nixvim, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./battery-monitor.nix
      ./bootloader.nix
      ./swap.nix
      ./bluetooth.nix
      ./pipewire.nix
      ./fonts.nix
      ./network.nix
    ];

  programs.steam.enable = true;
  services.flatpak.enable = true;

  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.static-web-server = {
    enable = true;
    root = "/home/daniil/sws";
  };

  modules.battery_monitor.enable = true;

  boot.kernelParams = [ "amdgpu.sg_display=0" ];

  services.udev.extraRules = ''
    KERNEL=="card1", SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
  '';

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Europe/Moscow";

  programs.hyprland.enable = true;  
  programs.hyprland.package = pkgs-master.hyprland;

  programs.thunar.enable = true;
  programs.xfconf.enable = true;

  users.users.daniil = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  environment.systemPackages = with pkgs; [
    lutris
    static-web-server
    tor-browser
    vim
    neovim
    (pkgs.wrapOBS { plugins = [ pkgs.obs-studio-plugins.obs-vaapi ]; })
    obsidian
    qbittorrent-qt5
    mpv
    ripgrep
    unzip
    wget
    git
    kitty
    wofi
    firefox
    librewolf
    wireproxy
    keepassxc
    telegram-desktop
    pavucontrol
    waybar
    hyprpaper
    grimblast
    dolphin-emu
    pkgs-dnvery.prismlauncherftb
    pkgs-dnvery.blueman
  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}
