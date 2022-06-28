{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    gitkraken
    jetbrains.datagrip
    jetbrains.rider
    jetbrains.webstorm
    openvpn
    slack
  ];
}
