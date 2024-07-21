{ config, pkgs, ...}:

{

  boot={
    
    loader = {
      systemd-boot.enable = true;

      efi.canTouchEfiVariables = true;
     }; 

    initrd.kernelModules = [ "amdgpu" ];

    kernelModules = [ "v4l2loopback" ];

    extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];

    extraModprobeConfig = ''
      options v4l2loopback exclusive_caps=1 devices=1
    '';
  };
}
