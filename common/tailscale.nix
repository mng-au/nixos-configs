{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tailscale
  ];  

  networking.firewall = {
    allowedUDPPorts = [ 3478 41641 ];
    # checkReversePath = "loose";
    enable = true;
    # trustedInterfaces = [ "tailscale0" ];
  };

  networking.nameservers = [ "127.0.0.1" ];
  
  services.dnsmasq = {
    enable = true;
    resolveLocalQueries = true;
    extraConfig = ''
      address=/syd.themfor.me/100.85.122.28

      bogus-priv

      domain-needed

      filterwin2k

      interface=lo

      # Tailscale Magic DNS
      server=100.100.100.100
      server=1.1.1.1
      server=1.0.0.1
    '';
  };

  # Magic DNS
  networking.search = [ "ng2matthew.gmail.com.beta.tailscale.net" ];

  services.tailscale.enable = true;
}
