{ config, pkgs, ... }:

{
  hardware = {

    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    graphics = {
    
      extraPackages = with pkgs; [
        amdvlk
        rocmPackages.clr.icd
      ];

      extraPackages32 = with pkgs.pkgsi686Linux; [
        libva
      ];

      # setLdLibraryPath = true;
    };

    pulseaudio.enable = false;
  };
}
