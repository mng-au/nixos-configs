{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    barrier
    brave
    enpass
    firefox
    gnome.gnome-shell-extensions
    gnome.gnome-tweaks
    nextcloud-client
    obsidian
    vlc
    virtmanager
    vscode
    thunderbird
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = false; # Disable Wayland until barrier add Wayland support
  };
  services.xserver.desktopManager.gnome.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
}