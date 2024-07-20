{config, pkgs, ...}:

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
          "pulseaudio"
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
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "CH {capacity}%";
        };

        "cava" = {
          # cava_config = "$HOME/.config/cava/cava.conf";
          framerate = 30;
          autosens = 1;
          sensitivity = 100;
          bars = 14;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          method = "pulse";
          source = "auto";
          stereo = true;
          reverse = false;
          bar_delimiter = 0;
          monstercat = false;
          waves = false;
          noise_reduction = 0.77;
          input_delay = 2;
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          actions = {
            on-click-right = "mode";
          };
        };
        
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

        "pulseaudio" = {
        	format = "{volume}% {icon}";
        	format-bluetooth = "{volume}% {icon}";
        	format-muted = "";
        	format-icons = {
        		headphones = "";
        		handsfree = "";
        		headset = "";
        		phone = "";
        		phone-muted = "";
        		portable = "";
        		car = "";
        		default = ["" ""];
        	};
        	scroll-step = 1;
          on-click = "amixer sset Master toggle";
        	on-click-right = "pavucontrol";
        };

        "tray" = {
          icon-size = 18;
          spacing = 10;
          show-passive-items = true;
        };

      

        # Custom Modules
        "custom/weather" = {
          exec = "sh $HOME/.dotfiles/scripts/wittr.sh";
          return-type = "json";
          format = "{}";
          spacing = 10;
          tooltip = true;
          interval = 900;
        };

        "custom/media" = {
          return-type = "json";
          exec = "waybar-mpris --autofocus --order 'SYMBOL:ARTIST:TITLE'";
          on-click = "waybar-mpris --send toggle";
          escape = true;
        };
      };
    };

    style = 
    ''
      # General settings
      * {
        font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
        font-size: 14px;
      }

      window#waybar {
        background: rgba(190, 188, 174,0.5);
        color: #e9f3f0;
        border-radius: 10px;
      }

      #battery,
      #cava,
      #clock,
      #pulseaudio,
      #tray,
      #custom-media,
      #custom-weather {
        background-color: #4A5152;
        padding-top: 1px;
        padding-bottom: 1px;
      }

      #battery {
        border-radius: 10px 0px 0px 10px;
        margin-right: 1px;
        padding-right: 5px;
        padding-left: 10px;
      }

      #clock {
        border-radius: 10px 0px 0px 10px;
        margin-right: 1px;
        padding-left: 10px;
        padding-right: 5px;
      }

      #pulseaudio {
        border-radius: 0px 10px 10px 0px;
        margin-left: 1px;
        min-width: 10px;
        padding-right: 10px;
        padding-left: 10px;
      }

      #tray {
        border-radius: 0px 10px 10px 0px;
        margin-left: 1px;
        min-width: 10px;
        padding-right: 10px;
        padding-left: 10px;
      }

      #custom-media{
        border-radius: 10px 0px 0px 10px;
        margin-left: 1px;
        padding-left: 10px;
        padding-right: 5px;
      }

      #custom-weather {
        border-radius: 0px 10px 10px 0px;
        margin-left: 1px;
        padding-right: 10px;
        padding-left: 5px;
      }
    ''; 
  };
}
