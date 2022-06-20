{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    barrier
  ];

  networking.firewall = {
    allowedTCPPorts = [ 24800 ];
    enable = true;
  };
}