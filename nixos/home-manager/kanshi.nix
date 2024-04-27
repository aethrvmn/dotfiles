{ config, ... }:

{
  services.kanshi = {
    enable = true;

    profiles = {
      home_office = {
        outputs = [
          {
            criteria = "DP-1";
            position = "1080, 550";
            mode = "1920x1080@120Hz";
          }
          {
            criteria = "DP-2";
            position = "0, 0";
            mode = "1920x1080@120Hz";
            transform = "90";
          }        
          {
            criteria = "HDMI-A-1";
            position = "300, 500";
            mode = "1920x1080@60Hz";
          }
        ];
      };
      # laptop = {
      #   outputs = [
          
      #   ];
      # };
    };
  };
}
