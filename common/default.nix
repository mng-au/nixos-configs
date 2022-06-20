{ config, pkgs, lib, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    barrier
    dig
    brave
    enpass
    firefox
    glances
    glxinfo    
    git
    gnome.gnome-shell-extensions
    gnome.gnome-tweaks
    nextcloud-client
    ntfs3g
    obsidian
    pciutils
    tmux
    vlc
    virt-manager
    vscode
    # thunderbird
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  time.hardwareClockInLocalTime = true;
  time.timeZone = "Australia/Sydney";

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.users.work = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
