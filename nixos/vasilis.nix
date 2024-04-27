{config, pkgs, lib, ...}:

{
  imports = 
    [
      ./home-manager/alacritty.nix
      ./home-manager/dots.nix
      ./home-manager/git.nix
      ./home-manager/gtk.nix
      ./home-manager/helix.nix
      ./home-manager/mako.nix
      ./home-manager/waybar.nix
      ./home-manager/zsh.nix
    ];
  
  home.username = "valapeos";
  home.homeDirectory = "/home/valapeos";
  home.stateVersion = "23.11";
  home.sessionVariables.GTK_THEME = "Adwaita-dark";
  
  home.packages = with pkgs; [
    _1password-gui
    bemenu
    btop
    cowsay
    filezilla
    git
    grim
    helix
    imv
    j4-dmenu-desktop
    labwc-tweaks
    lutris
    mpd
    mpv
    neofetch
    slurp
    swappy
    swww
    telegram-desktop
    texstudio
    vesktop
    whatsapp-for-linux
    wlr-randr
    xfce.xfce4-settings
    zotero
    zsh-powerlevel10k
  ];
}
