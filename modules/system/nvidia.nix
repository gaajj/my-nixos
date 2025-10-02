{ config, lib, pkgs, ... }:
{
  # Use the proprietary driver for X11
  services.xserver.videoDrivers = [ "nvidia" ];

  # Newer NixOS (24.11/25.05+) graphics toggle
  hardware.graphics.enable = true;

  hardware.nvidia = {
    # Required for X/GL
    modesetting.enable = true;

    # Use the proprietary (closed) driver; set to true if you want the open kernel module
    open = false;

    # Ship the control panel and friends
    nvidiaSettings = true;

    # Pick a driver track; 'stable' is usually best
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Better battery behaviour on laptops (Turing+ supports finegrained)
    powerManagement.enable = true;
    powerManagement.finegrained = lib.mkDefault true;

    # PRIME offloading (iGPU renders most things; NVIDIA on demand)
    prime = {
      offload.enable = true;

      # TODO: set these to your actual bus IDs (see step 3)
      # For AMD iGPU:
      amdgpuBusId = "PCI:0:0:0";
      # For Intel iGPU instead, comment the line above and use:
      # intelBusId = "PCI:0:2:0";

      nvidiaBusId = "PCI:1:0:0";
    };
  };

  environment.systemPackages = with pkgs; [
    glxinfo          # from mesa-utils, useful for testing (via pkgs.mesa-demos)
    vulkan-tools
  ];
}
