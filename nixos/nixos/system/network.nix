{ config, pkgs, ... }:

{
  networking = {
    
    hostName = "valanixos"; # Define your hostname.
    
    # Enables wireless support via wpa_supplicant.
    # wireless.enable = true;
    
    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    };
}
