{ config, pkgs, ... }:

{
  services = {
    xserver.enable = true;

    greetd = {
      enable = true;

      settings={
        default_session={
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --user-menu -rti --asterisks --cmd labwc";
          user = "greeter";
        };
      };
    };
  };

  programs = {
    labwc.enable = true;
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

}
