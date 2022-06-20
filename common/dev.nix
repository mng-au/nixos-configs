{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    dotnet-sdk
    gitkraken
    jetbrains.datagrip
    jetbrains.goland
    jetbrains.rider
    jetbrains.webstorm    
    mono
    msbuild
    nodejs-slim-14_x
    openvpn
    slack
  ];
}

# TODO:
#   NPM Global
#     https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally
