# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_zen;

  hardware.enableRedistributableFirmware = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "daniil" ];

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 8*1024; # 16 GB
  }];
  zramSwap.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      #Optional helps save long term battery health
      # START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
      # STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
    };
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  services.tumbler.enable = true;

  services.udisks2.enable = true;

  programs.clash-verge = {
    enable = true;
    tunMode = true;
    serviceMode = true;
  };

  programs.zsh.enable = true;

  services.upower.enable = true;

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      maple-mono.NF
      inter-nerdfont
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Inter Nerd Font" ];
        sansSerif = [ "Inter Nerd Font" ];
        monospace = [ "Maple Mono NF" ];
      };
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # services.pipewire.extraConfig.pipewire."92-low-latency" = {
  #   "context.properties" = {
  #     "default.clock.rate" = 48000;
  #     "default.clock.quantum" = 4096;
  #     "default.clock.min-quantum" = 512;
  #     "default.clock.max-quantum" = 16384;
  #   };
  # };

  # services.pipewire.extraConfig.pipewire-pulse."92-low-latency" = {
  #   "context.properties" = [
  #     {
  #       name = "libpipewire-module-protocol-pulse";
  #       args = { };
  #     }
  #   ];
  #   "pulse.properties" = {
  #     "pulse.min.req" = "1024/48000";
  #     "pulse.default.req" = "1024/48000";
  #     "pulse.max.req" = "1024/48000";
  #     "pulse.min.quantum" = "1024/48000";
  #     "pulse.max.quantum" = "1024/48000";
  #   };
  #   "stream.properties" = {
  #     "node.latency" = "32/48000";
  #     "resample.quality" = 1;
  #   };
  # };

  nixpkgs.config.allowUnfree = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  programs.hyprland.enable = true;
  programs.firefox.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.daniil = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    kitty
    wofi
    git
    telegram-desktop
    brightnessctl
    jetbrains-toolbox
    prismlauncher
    keepassxc
    obsidian
    xfce.ristretto
    jetbrains.idea-community
    jetbrains.idea-ultimate
    # jetbrains.idea-ultimate
    # jetbrains.rust-rover
    jetbrains.pycharm-community
    python3
    zed-editor-fhs
    devenv
    qbittorrent
    hyprshot
    libreoffice
    calibre
    (bottles.override { removeWarningPopup = true; })
  ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
