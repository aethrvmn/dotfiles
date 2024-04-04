{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Vasilis Valatsos";
    userEmail = "vasilvalat@gmail.com";
  };
}
