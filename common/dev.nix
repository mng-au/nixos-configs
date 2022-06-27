{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    openvpn
    slack
  ];
}
