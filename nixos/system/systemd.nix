{ config, pkgs, ... }:

{
  systemd = {
    user.services.kanshi = {
      enable = true;

      description = "kanshi daemon";
      wantedBy = [];
      after = [];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.kanshi}/bin/kanshi -c kanshi_config_file";
      };
    };
  };
}
