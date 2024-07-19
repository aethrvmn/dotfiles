{config, pkgs, lib, ...}:

{
  imports = 
    [
      ./home-manager/alacritty.nix
      ./home-manager/dots.nix
      ./home-manager/git.nix
      ./home-manager/gtk.nix
      ./home-manager/helix.nix
      ./home-manager/kanshi.nix
      ./home-manager/mako.nix
      ./home-manager/ohmyposh.nix
      ./home-manager/waybar.nix
      ./home-manager/zsh.nix
    ];
  
  home.username = "aethrvmn";
  home.homeDirectory = "/home/aethrvmn";
  home.stateVersion = "23.11";
  home.sessionVariables.GTK_THEME = "Adwaita-dark";
  
  home.packages = with pkgs; [
    _1password-gui
    audacity
    bemenu
    btop
    czkawka
    cowsay
    fastfetch
    filezilla
    git
    godot_4
    grim
    helix
    imv
    j4-dmenu-desktop
    kanshi
    labwc-tweaks
    lutris
    mpd
    mpv
    slurp
    swappy
    swww
    telegram-desktop
    wlr-randr
    xfce.mousepad
    xfce.xfce4-settings
    zotero
  ];
}
