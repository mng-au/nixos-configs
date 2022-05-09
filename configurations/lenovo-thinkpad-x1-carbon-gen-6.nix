# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  ipaddr = {
    addresses = [
      {
        address = "192.168.11.17";
        prefixLength = 22;
      }
    ];
  };
in {
  imports =
    [
      ../hardware-configuration.nix
      ../common.nix
      ../docker.nix
      ../dev.nix
      ../dev-flutter.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    thinkfan
  ];

  fileSystems = {
    "/home" = {
      device = "/dev/disk/by-uuid/8073117a-81aa-41f5-bc5a-105240b5da14";
      fsType = "btrfs";
      options = [ "subvol=/@home" ];
    };
  };

  networking.hostName = "thinkpadx1carbon";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.defaultGateway = "192.168.9.1";
  networking.nameservers = [
    "192.168.9.2"
    "192.168.9.3"
  ];

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = false;
  networking.interfaces.enp0s20f0u1 = {
    ipv4 = ipaddr;
  };
  networking.interfaces.wlp4s0 = {
    ipv4 = ipaddr;
  };
  networking.interfaces.wwp0s20f0u2c2.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}
