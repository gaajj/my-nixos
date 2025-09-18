{ config, pkgs, ... }:
{
  imports = [
    ../bart/hardware-configuration.nix
    ../../modules/system/base.nix
    ../../modules/system/networking.nix
    ../../modules/system/audio.nix
    ../../modules/system/desktop.nix
    ../../modules/system/fonts.nix
    ../../modules/services/ssh.nix
    ../../users/gaaj.nix
  ];

  system.stateVersion = "25.05";
}

