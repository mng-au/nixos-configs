{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    enpass
    firefox
    git
    pciutils
    tmux
    vscode

    (steam.override {
       withPrimus = true;
       # extraPkgs = pkgs: [ bumblebee glxinfo ];
    }).run
  ];

  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true;
    # dedicatedServer.openFirewall = true;
  };
}