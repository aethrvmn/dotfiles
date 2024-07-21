{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;

      videoDrivers = ["amdgpu"];
      xkb.layout = "us";
      wacom.enable = true;

    };

    printing.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;

    pipewire = {
      enable = true;

      audio.enable = true;

      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
    };
  };
}
