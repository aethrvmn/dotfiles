{ config, pkgs, lib, ... }:

{
  home.username = "konstantina";
  home.homeDirectory = "/home/konstantina";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
  ];

  programs.chromium.enable = true;
}
