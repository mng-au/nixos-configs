# Configuration Alienware m17 r5

{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./hardware/nvidia-offload.nix

      ./common/default.nix
      ./common/barrier-server.nix
      ./common/dev.nix
      ./common/fish.nix
      ./common/tailscale.nix
      ./common/steam.nix
    ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };

    grub = {
      configurationLimit = 2;
      device = "nodev";
      efiSupport = true;
      enable = true;
    };
  };

  fileSystems = {
    "/".options = [ "autodefrag" "compress=zstd" "noatime" ];

    "/work" = {
      device = "/dev/disk/by-uuid/c955c6c1-baf9-4b32-82ff-d44dfd66b499";
      fsType = "btrfs";
      options = [ "subvol=/@work" ];
    };
  };

  hardware.bluetooth.enable = true;

  hardware.enableRedistributableFirmware = true;

  networking.hostName = "alienwarem17r5";  

  networking.networkmanager.enable = true;

  programs.light.enable = true;

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  services.fwupd.enable = true;

  services.thermald.enable = true;

  services.xserver = {
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = false;
    desktopManager.gnome.enable = true;
    enable = true;
  };

  specialisation = {

    # nvidia-offline / laptop mode
    nvidia-offload.configuration = {
      hardware.nvidia.prime.offload.enable = lib.mkForce true;
      hardware.nvidia.prime.sync.enable = lib.mkForce false;
      hardware.nvidia.powerManagement.enable = lib.mkForce true;

      system.nixos.tags = [ "nvidia-offline" ];
    };

  };  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  networking.firewall = {
    enable = true;
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
