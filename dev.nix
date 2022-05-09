{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.datagrip
    jetbrains.goland
    jetbrains.rider
    gitkraken
  ];
}