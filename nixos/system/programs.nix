{ config, pkgs, ... }:

{
  programs = {
    chromium.enable = true;
    
    zsh.enable = true;

    firefox.enable = true;

    file-roller.enable = true;

    labwc.enable = true;

    waybar.enable = true;
  };
}
