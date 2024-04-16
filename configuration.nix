{ config, lib, pkgs, pkgs-master, pkgs-stable, pkgs-dnvery, nixvim, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./battery-monitor.nix
    ];

  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
    plugins.lsp = {
      enable = true;
      servers = {
        lua-ls = { enable = true; };
        java-language-server = { enable = true; };
        nil_ls = { enable = true; };
      };
    };
    plugins.neo-tree.enable = true;
    plugins.nvim-jdtls = {
      enable = true;
      cmd = [
        (lib.getExe pkgs.jdt-language-server)
      ];
    };
    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<C-b>";
        mode = "n";
        options = {
          desc = "Toggle Tree View.";
        };
      }
    ];
    opts = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;

      smartindent = true;
      shiftwidth = 2;

      breakindent = true;
    };
  };

  modules.battery_monitor.enable = true;

  boot.kernelParams = [ "amdgpu.sg_display=0" ];
  boot.loader.systemd-boot.configurationLimit = 10;

  services.udev.extraRules = ''
    KERNEL=="card1", SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
  '';

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  fonts = {
    packages = with pkgs-master; [ 
#      nerdfonts
      (pkgs.callPackage ./apple-nerd-fonts.nix {})
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "SFProDisplay Nerd Font" ];
        sansSerif = [ "SFProDisplay Nerd Font" ];
        monospace = [ "SFMono Nerd Font" ];
      };
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  
  networking.wireless.iwd.enable = true;
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  time.timeZone = "Europe/Moscow";

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
    vim
    neovim
    fontforge
    #lua-language-server
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
    pkgs-dnvery.nerd-font-patcher
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
