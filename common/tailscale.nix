{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tailscale
  ];

  networking.firewall = {
    allowedUDPPorts = [ 3478 41641 ];
    # checkReversePath = "loose";
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
  };

  services.tailscale.enable = true;
}
