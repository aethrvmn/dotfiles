{ config, ... }:

{
  services.kanshi = {
    enable = true;
    systemdTarget="";

    settings = [
      {
        profile.name = "home_office";
        profile.outputs = [
          {
            criteria = "DP-1";
            position = "1080,550";
            mode = "1920x1080@120Hz";
            adaptiveSync = true;
          }
          {
            criteria = "DP-2";
            position = "0,0";
            mode = "1920x1080@120Hz";
            transform = "90";
            adaptiveSync = true;
          }        
          {
            criteria = "HDMI-A-1";
            position = "3000,550";
            mode = "1920x1080@60Hz";
          }
        ];
      }

      {
        profile.name = "laptop";
        profile.outputs =[
          {
            criteria = "eDP-1";
            mode = "1920x1080";
          }          
        ];
      }
    ];
  };
}
