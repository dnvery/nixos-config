# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  nixpkgs.config.allowUnfree = true;

  fonts = {
    packages = with pkgs; [
      inter-nerdfont
      maple-mono.NF
    ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Inter Nerd Font" ];
        serif = [ "Inter Nerd Font" ];
        monospace = [ "Maple Mono NF" ];
      };
    };
  };

  nixpkgs.config.packageOverrides = pkgs: {
    openldap = pkgs.openldap.overrideAttrs (oldAttrs: {
      doCheck = false;
    });
    bottles = pkgs.bottles.override {
      removeWarningPopup = true;
    };
  };

  virtualisation.docker = {
    enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable zram swap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  # Add swap file as fallback
  swapDevices = [{
    device = "/swapfile";
    size = 8192; # 8GB, adjust based on your needs
  }];

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # RyzenAdj temperature limit service
  systemd.services.ryzenadj-temp-limit = {
    description = "Set AMD CPU temperature limit to 77C";
    wantedBy = [ "multi-user.target" ];
    after = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.ryzenadj}/bin/ryzenadj --tctl-temp=77";
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.hyprland.enable = true;

  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  users.users.daniil = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" "adbusers" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  programs.firefox.enable = true;

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    tunMode = true;
    autoStart = true;
  };

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    hyprlauncher
    nodejs
    claude-code
    gemini-cli
    bottles
    ryzenadj
    telegram-desktop
    keepassxc
    brightnessctl
    android-studio
    android-tools
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  networking.firewall = {
    # Allow the TUN interface through the firewall
    trustedInterfaces = [ "Mihomo" "Meta" ];  # Both names work

    # Trust local network traffic (bypass VPN for LAN)
    extraCommands = ''
      iptables -A INPUT -s 192.168.0.0/16 -j ACCEPT
      iptables -A OUTPUT -d 192.168.0.0/16 -j ACCEPT
    '';

    # Disable reverse path filtering for the TUN interface
    extraReversePathFilterRules = ''
      iifname { "Mihomo", "Meta" } accept comment "trusted interface for clash verge"
    '';

    # Allow ADB wireless debugging
    allowedTCPPortRanges = [
      { from = 37000; to = 44000; }  # ADB wireless debugging port range
    ];
    allowedTCPPorts = [ 5555 ];  # Standard ADB port
    allowedUDPPorts = [ 5353 ];  # mDNS for device discovery
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

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
  system.stateVersion = "26.05"; # Did you read the comment?

}

