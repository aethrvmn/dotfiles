{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
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

}
