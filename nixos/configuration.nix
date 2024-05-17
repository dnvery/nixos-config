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

  nixpkgs.overlays = [(
    final: prev:
    {
      prismlauncher-unwrapped = prev.prismlauncher-unwrapped.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          (prev.fetchpatch {
            url = "https://github.com/dnvery/PrismLauncherFTB/commit/470430ce599ddbc972a4e013832986884124da3c.patch";
            hash = "sha256-pzL9xl6y3BuAUG7eN2WgRyd0p4bcoGG92bHyrtCFgC8=";
          })
        ];
      });

      hyprland = prev.hyprland.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          (prev.fetchpatch {
            url = "https://github.com/hyprwm/Hyprland/commit/1584679004435d93d5fe2dd794d2aefaa0c9574a.patch";
            hash = "sha256-IhptzW73q5O2A1d/6WCZn6X3x8kV4yTN7v9eRjpVgv4=";
          })
        ];
      });
    }
  )];
  
  environment.systemPackages = with pkgs; [
    lutris
    jetbrains.idea-community
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
    prismlauncher
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
