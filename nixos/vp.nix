{config, pkgs, lib, ...}:

{
  imports = 
    [
      ./home-manager/alacritty.nix
      ./home-manager/git.nix
      ./home-manager/zsh.nix
      ./home-manager/dots.nix
    ];
  
  home.username = "valapeos";
  home.homeDirectory = "/home/valapeos";
  home.stateVersion = "23.11";
  
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
    kanshi
    labwc-tweaks
    lutris
    mako
    mpd
    mpv
    neofetch
    slurp
    swappy
    swww
    texstudio
    vesktop
    wlr-randr
    zsh-powerlevel10k
  ];

  gtk = {
    enable = true;

    gtk3.extraConfig = {
        gtk-application-prefer-dark-theme=1;
      };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  
  };
}
