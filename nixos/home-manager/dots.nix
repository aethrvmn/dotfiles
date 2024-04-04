{ config, ... }:

{
  # Raw config files
  home.file.".config/helix".source = /home/valapeos/dotfiles/.config/helix;
  home.file.".config/kanshi".source = /home/valapeos/dotfiles/.config/kanshi;
  home.file.".config/labwc".source = /home/valapeos/dotfiles/.config/labwc;
  home.file.".config/mako".source = /home/valapeos/dotfiles/.config/mako;
  home.file.".config/waybar".source = /home/valapeos/dotfiles/.config/waybar;
  home.file.".config/wlogout".source = /home/valapeos/dotfiles/.config/wlogout;
}
