{ config, ... }:

{
  # Raw config files for the programs that Nix doesn't support yet
  home.file.".config/labwc".source = "labwc";

  # This is a custom theme I'm working on for my system
  home.file.".themes/Orzhov".source = "Orzhov";
}
