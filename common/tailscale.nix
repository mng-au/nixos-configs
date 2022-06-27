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

      interface=lo

      server=100.74.157.60
      server=1.1.1.1
    '';
  };

  # networking.search = [ "proj.2501" ];

  services.tailscale.enable = true;
}
