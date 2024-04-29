{config, ...}:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        # General settings
        reload_style_on_change = true;

        output = [
          "DP-1"
        ];
        
        layer = "bottom";
        position = "top";

        spacing = 0;
        margin = "5";

        # Modules definition
        
        modules-left = [
          "custom/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
        ];

        # Modules Configuration
        "clock" = {
          format = "{:%R %b %d}";
          timezone = "Europe/Rome";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";               
              weeks = "<span color='#99ffdd'><b>{}</b></span>";               
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";               
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";  
            };
          };
          on-click = "thunderbird";
        };

        "tray" = {
          icon-size = 18;
          spacing = 10;
          show-passive-items = true;
        };

        "custom/workspaces" = {
          exec = "~/dotfiles/scripts/workspaces";
        };
      };
    };

    style = 
    ''
      # General settings
      * {
        font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
        font-size: 15px;
      }

      window#waybar {
        background: rgba(190, 188, 174,0.5);
        color: #e9f3f0;
        border-radius: 10px;
      }

      #clock,
      #tray,
      #custom-workspaces {
        background-color: #4A5152;
        border-radius: 10px;
        padding: 5px; 
      }

      #clock {
        padding-left: 7px;
        padding-right: 7px;
      }

      #tray {
        padding-right: 5px;
        padding-left: 5px;
      }

      #custom-workspace{
        padding-left: 10px;
        padding-right: 10px;
      }
      ''; 
  };
}
