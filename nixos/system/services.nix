{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;

      videoDrivers = ["amdgpu"];
      xkb.layout = "us";
      wacom.enable = true;

    # This is broken and I am not smart enough to fix it
      displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = true;
        
        # session = [{
          # manage = "desktop";
          # name = "labwc";
          # start = ''exec labwc'';
        # }];
      };
      desktopManager.plasma5.enable = true;
      # desktopManager.gnome.enable = true;
    };

    printing.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;

    # greetd = {
      # enable = true;

      # settings = {
        # default_session={
          # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --user-menu -r -t -i --asterisks";
          # user = "greeter";
        # };
      # };
    # };

    pipewire = {
      enable = true;

      audio.enable = true;

      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
    };
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
