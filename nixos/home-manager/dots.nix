{ config, ... }:

let
  dotdir = "/home/valapeos/dotfiles";
in
{
  # Raw config files for the programs that Nix doesn't support yet
  home.file.".config/labwc".source = dotdir+"/labwc";

  # This is a custom theme I'm working on for my system
  home.file.".themes/Orzhov".source = dotdir+"/Orzhov";

  # For some reason I can't get kanshi to work using home-manager
  # home.file.".config/kanshi".source = dotdir+"/kanshi";
}
