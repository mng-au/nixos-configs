{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker-compose
  ];  

  users.users.user.extraGroups = [ "docker" ];
  users.users.work.extraGroups = [ "docker" ];

  virtualisation.docker.enable = true;
}