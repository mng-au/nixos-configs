{ config, pkgs, ... }:

{
  boot.loader.grub.configurationLimit = 3;
  boot.loader.systemd-boot.configurationLimit = 3;

  environment.systemPackages = with pkgs; [
    git
    glances
    htop
    ncdu
    tmux
  ];

  i18n.defaultLocale = "en_AU.UTF-8";

  programs.fish.enable = true;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 19999 ];

  nixpkgs.config.allowUnfree = true;

  services.netdata.enable = true;

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