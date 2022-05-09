{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-studio
    android-tools
    dart
    flutter
    google-chrome
  ];

  programs.adb.enable = true;

  services.udev.packages = with pkgs; [
    android-udev-rules
  ];

  users.users.user.extraGroups = ["adbusers"];
}