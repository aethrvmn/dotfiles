# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Enable home manager
      <home-manager/nixos>

      # Custom modules
      ./system/boot.nix
      ./system/hardware.nix
      ./system/network.nix
      ./system/programs.nix
      ./system/services.nix
      ./system/systemd.nix
      ./system/labwc.nix
    ];

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "el_GR.UTF-8";
      LC_IDENTIFICATION = "el_GR.UTF-8";
      LC_MEASUREMENT = "el_GR.UTF-8";
      LC_MONETARY = "el_GR.UTF-8";
      LC_NAME = "el_GR.UTF-8";
      LC_NUMERIC = "el_GR.UTF-8";
      LC_PAPER = "el_GR.UTF-8";
      LC_TELEPHONE = "el_GR.UTF-8";
      LC_TIME = "el_GR.UTF-8";
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;  

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.valapeos = {
      isNormalUser = true;
      description = "Vasilis";
      password = "gang";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
  
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.valapeos = import ./vasilis.nix;
  };
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Garbage collection
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
    dates = "weekly";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    bash
    dotnetCorePackages.sdk_9_0
    gcc
    greetd.tuigreet
    helix
    hugo
    jitsi
    localsend
    nim
    obs-studio
    pavucontrol
    playerctl
    poetry
    python311Full
    python311Packages.stdenv
    qbittorrent
    stdenv.cc.cc.lib
    slurp
    spotify
    texliveFull
    thunderbird
    udisks
    linuxPackages.v4l2loopback
    usbutils
    v4l-utils
    ventoy
    wget
    wineWowPackages.waylandFull
    zlib
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    font-awesome
    meslo-lgs-nf
  ];

  # Env settings
  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
    NIXOS_OZONE_WL = "1";
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
