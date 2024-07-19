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
          "eDP-1"
        ];
        
        layer = "bottom";
        position = "top";

        spacing = 0;
        margin = "5";

        # Modules definition
        
        modules-left = [
          "custom/media"
          # "cava"
        ];

        modules-center = [
          "clock"
          "custom/weather"
        ];

        modules-right = [
          "battery"
          "tray"
        ];

        # Modules Configuration
        # "cava" = {
        #   cava_config = "$HOME/cava/cava.conf";
        #   framerate = 30;
        #   autosens = 1;
        #   sensitivity = 100;
        #   bars = 14;
        #   lower_cutoff_freq = 50;
        #   higher_cutoff_freq = 10000;
        #   method = "pulse";
        #   source = "auto";
        #   stereo = true;
        #   reverse = false;
        #   bar_delimiter = 0;
        #   monstercat = false;
        #   waves = false;
        #   noise_reduction = 0.77;
        #   input_delay = 2;
        #   format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        #   actions = {
        #     on-click-right = "mode";
        #   };
        # };
        
        "clock" = {
          format = "{:%R %b %d}";
          timezone = "Europe/Athens";
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

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "CH {capacity}%";
        };

        "custom/weather" = {
          exec = "$HOME/.dotfiles/scripts/wittr.sh";
          return-type = "json";
          format = "{}";
          spacing = 10;
          tooltip = true;
          interval = 900;
        };

        "custom/media" = {
          format = "{icon} {}";
          escape = true;
          return-type = "json";
          max-length = 40;
          on-click = "playerctl play-pause";
          on-click-right = "playerctl stop";
          smooth-scrolling-threshold = 10;
          on-scroll-up = "playerctl next";
          on-scroll-down = "playerctl previous";
          exec = "$HOME/.dotfiles/scripts/mediaplayer.py 2> /dev/null";     
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
      #battery,
      #custom-media,
      #cava {
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

      #battery {
        padding-right: 5px;
        padding-left: 5px;
      }

      #custom-media{
        padding-left: 10px;
        padding-right: 10px;
      }

      ''; 
  };
}
