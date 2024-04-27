{ config, ... }:

{
  # Raw config files for the programs that Nix doesn't support yet
  home.file.".config/labwc".source = /home/valapeos/dotfiles/labwc;
  home.file.".themes/Orzhov".source = /home/valapeos/dotfiles/Orzhov;
}
