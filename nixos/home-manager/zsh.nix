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
      nix-update = "sudo cp -r /etc/nixos ~/.dotfiles && sudo nixos-rebuild switch";
      nix-config = "sudo -E hx /etc/nixos";
      
      # Aliases for color options
      ls = "eza --icons=always --color=always";
      ll = "eza -a --color=always --long -tree --icons=always --no-time --no-user";
      cat = "bat";
      grep = "grep --color=auto";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";

      # Misc
      # .. = "cd ..";
      mv = "mv -i";
      cp = "cp -i";
      rm = "rm -i";
    };


    initExtra = ''
      eval "$(oh-my-posh init zsh --config /home/aethrvmn/.config/ohmyposh/config.json)"
      eval "$(atuin init zsh)"
      eval "$(ssh-agent -s)"
      clear
    '';
    
  };

}
