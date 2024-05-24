{ config, pkgs, ... }:

{
  services.xserver = {
    enable=true;
    
    desktopManager={
      xterm.enable=false;
      xfce.enable=true;
    };

    displayManager={
      lightdm.enable=true;
      defaultSession="xfce";
    };
  };
}
