{ config, lib, pkgs, ... }:

{
  services.dnsmasq = {
    enable = true;
    resolveLocalQueries = true;
    extraConfig = ''
      address=/asusrog/100.102.4.27
      address=/rasp4b-2/100.85.122.28
      address=/syd.themfor.me/100.85.122.28

      bogus-priv

      domain-needed

      filterwin2k

      interface=lo

      server=1.1.1.1
      server=1.0.0.1
    '';
  };
}
