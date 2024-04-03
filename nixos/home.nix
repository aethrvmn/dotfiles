{config, pkgs, lib, ...}:

{
  home.username = "valapeos";
  home.homeDirectory = "/home/valapeos";
  home.stateVersion = "23.11";
  
  
  # Raw config files
  home.file.".config/helix".source = /home/valapeos/dotfiles/.config/helix;
  home.file.".config/kanshi".source = /home/valapeos/dotfiles/.config/kanshi;
  home.file.".config/labwc".source = /home/valapeos/dotfiles/.config/labwc;
  home.file.".config/mako".source = /home/valapeos/dotfiles/.config/mako;
  home.file.".config/waybar".source = /home/valapeos/dotfiles/.config/waybar;
  home.file.".config/wlogout".source = /home/valapeos/dotfiles/.config/wlogout;

  home.packages = with pkgs; [
    _1password-gui
    atuin
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
    labwc
    mako
    mpd
    mpv
    neofetch
    slurp
    swappy
    swww
    texstudio
    vesktop
    wlogout
    wlr-randr
    zsh-powerlevel10k
  ];
  
  programs.git = {
    enable = true;
    userName  = "Vasilis Valatsos";
    userEmail = "vasilvalat@gmail.com";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      
      window = {
        padding.x = 10;
        padding.y = 10;
        decorations = "None";
        opacity = 0.95; #Until blur is an option
        blur = true;
        dimensions.columns = 80;
        dimensions.lines = 24;
      };

      font = {
        size = 12.0;

        normal.family = "MesloLGS NF";
      };

      cursor.style = "Underline";

      colors = {
        primary = {
          background = "#2D2A2E";
          foreground = "#fff1f3";
        };

        normal = {
          black   = "#2c2525";
          red     = "#fd6883";
          green   = "#adda78";
          yellow  = "#f9cc6c";
          blue    = "#f38d70";
          magenta = "#a8a9eb";
          cyan    = "#85dacc";
          white   = "#fff1f3";
        };

        bright = {
          black   = "#72696a";
          red     = "#fd6883";
          green   = "#adda78";
          yellow  = "#f9cc6c";
          blue    = "#f38d70";
          magenta = "#a8a9eb";
          cyan    = "#85dacc";
          white   = "#fff1f3";
        };
      };
    };
  };

  programs.zsh = {
    enable = true;

    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    # dirHashes = {
    #   docs = "~/Documents"
    #   ...
    # }

    shellAliases = {

      # Nix specific
      nix-update = "sudo cp -r /etc/nixos ~/dotfiles && cp -r ~/.p10k-config ~/dotfiles && sudo nixos-rebuild switch";
      nix-config = "sudo -E hx /etc/nixos";
      
      # Thesis specific
      thesis = "cd ~/Projects/thesis && source venv/bin/activate";
      thesis-tex = "cd ~/Documents/tex/thesis";

      # Aliases for color options
      ls = "ls -G";
      ll = "ls -l";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";

      # Misc
      # .. = "cd ..";
      cp = "cp -i";
      rm = "rm -i";
    };


    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource /home/valapeos/.p10k-config;
        file = "p10k.zsh";
      }
    ];
    
    initExtra = "source ~/.p10k.zsh";
    
  };

  gtk = {
    enable = true;
  
    
  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };

    # theme = {
    #   name = "Adwaita-dark";
    #   package = pkgs.gnome.gnome-themes-extra;
    # };

    gtk3.extraConfig = {
        gtk-application-prefer-dark-theme=1;
      };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style.name = "adwaita-dark";
  };


}
