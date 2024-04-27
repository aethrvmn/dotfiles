{ config, ... }:

{
  services.mako = {
    enable = true;

    layer = "top";

    output = "DP-1";

    backgroundColor = "#4A5152";

    borderSize = 2;
    borderColor = "#BEBCAE";

    defaultTimeout = 5000;
    ignoreTimeout = true;

  };
}
