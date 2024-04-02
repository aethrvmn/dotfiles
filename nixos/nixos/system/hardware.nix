{ config, pkgs, ... }:

{
  hardware = {

    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    opengl.extraPackages = with pkgs; [
      amdvlk
      rocmPackages.clr.icd
    ];
  };
}
