{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";

    displayManager.lightdm.enable = true;

    windowManager.bspwm.enable = true;

    desktopManager.xterm.enable = false;
  };

  environment.systemPackages = with pkgs; [
    xorg.xauth
    xorg.xhost
    bspwm
    sxhkd
    dmenu
    alacritty
  ];
}
