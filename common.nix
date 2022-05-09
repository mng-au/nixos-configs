{ config, pkgs, ... }:

{
  boot.loader.grub.configurationLimit = 3;
  boot.loader.systemd-boot.configurationLimit = 3;

  environment.systemPackages = with pkgs; [
    barrier
    brave
    enpass
    firefox
    git
    glances
    gnome.gnome-shell-extensions
    gnome.gnome-tweaks
    htop
    ncdu
    nextcloud-client
    obsidian
    virtmanager
    vscode
    tmux
    thunderbird
  ];

  i18n.defaultLocale = "en_AU.UTF-8";

  programs.fish.enable = true;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 19999 ];

  nixpkgs.config.allowUnfree = true;

  services.netdata.enable = true;

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

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  users.defaultUserShell = pkgs.fish;

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.users.work = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}