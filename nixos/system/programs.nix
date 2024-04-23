{ config, pkgs, ... }:

{
  programs = {
    chromium.enable = true;
   
    firefox.enable = true;

    file-roller.enable = true;

    labwc.enable = true;

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        zlib
        libgcc
      ];
    };

    steam.enable = true;

    thunar = {
      enable = true;

      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
   
    waybar.enable = true;

    zsh.enable = true;
    
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

  };
}
