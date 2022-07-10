{ config, pkgs, lib, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    barrier
    bitwarden
    dig
    brave
    firefox
    glances
    glxinfo
    git
    gnome.gnome-shell-extensions
    gnome.gnome-tweaks
    gparted
    htop
    krita
    librewolf
    ncdu
    neofetch
    nextcloud-client
    ntfs3g
    obsidian
    pciutils
    tmux
    thunderbird
    veracrypt
    vlc
    virt-manager
    vscode
    zip    
  ];

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;  

  i18n.defaultLocale = "en_AU.UTF-8";

  # List services that you want to enable:
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
