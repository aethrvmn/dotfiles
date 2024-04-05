{ config, pkgs, ... }:

{
  
  programs.alacritty = {
    enable = true;
    settings = {
   
      window = {
        padding.x = 10;
        padding.y = 10;
        decorations = "None";
        opacity = 0.85; #Until blur is an option
        blur = true;
        dimensions.columns = 80;
        dimensions.lines = 24;
      };

      font = {
        size = 12;

        normal.family = "MesloLGS NF";
      };

      cursor.style = "Underline";

      colors = {
        primary = {
          background = "#2D2A2E";
          foreground = "#fff1f3";
        };

        normal = {
          black   = "#2c2525";
          red     = "#fd6883";
          green   = "#adda78";
          yellow  = "#f9cc6c";
          blue    = "#f38d70";
          magenta = "#a8a9eb";
          cyan    = "#85dacc";
          white   = "#fff1f3";
        };

        bright = {
          black   = "#72696a";
          red     = "#fd6883";
          green   = "#adda78";
          yellow  = "#f9cc6c";
          blue    = "#f38d70";
          magenta = "#a8a9eb";
          cyan    = "#85dacc";
          white   = "#fff1f3";
        };
      };
    };
  };
}
