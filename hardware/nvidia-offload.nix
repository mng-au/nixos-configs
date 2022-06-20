{ config, lib, pkgs, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in
{
  environment.systemPackages = with pkgs; [
    nvidia-offload
  ];

  hardware.nvidia.prime = {    
    amdgpuBusId = "PCI:5:0:0";
    offload.enable = false;    
    nvidiaBusId = "PCI:1:0:0";
    sync.enable = true;
  };

  # External display mode as default
  # hardware.nvidia.prime.offload.enable = false;
  # hardware.nvidia.powerManagement.enable = false;

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
    ];
  };

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];
}