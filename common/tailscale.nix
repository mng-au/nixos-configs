{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tailscale
  ];  

  networking.firewall = {
    allowedUDPPorts = [ 3478 41641 ];
    checkReversePath = "loose";
    enable = true;
    # trustedInterfaces = [ "tailscale0" ];
  };

  networking.nameservers = [ "127.0.0.1" ];
  
  services.dnsmasq = {
    enable = true;
    resolveLocalQueries = true;
    extraConfig = ''
      bogus-priv
      # domain-needed
      filterwin2k
      no-resolv

      # Send query to all servers
      # all-server

      # no-negcache

      interface=lo

      server=/tailscale.com/1.1.1.1
      server=100.74.157.60
      server=1.1.1.1
    '';
  };

  services.tailscale.enable = true;
}
