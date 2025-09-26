{ config, pkgs, self, ... }:
{
  imports = [
    ../modules/home/zsh.nix
    ../modules/home/starship.nix
    ../modules/home/kitty.nix
    ../modules/home/tmux.nix
  ];

  home.username = "gaaj";
  home.homeDirectory = "/home/gaaj";

  programs.home-manager.enable = true;
  programs.git.enable = true;

  xsession.enable = true;

xsession.windowManager.bspwm = {
    enable = true;
    rules = { };
    settings = {
      border_width = 2;
      window_gap = 8;
      focus_follows_pointer = true;
    };
  };

  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + Return" = "kitty";
      "super + d"      = "dmenu_run";

      "super + h" = "bspc node -f west";
      "super + j" = "bspc node -f south";
      "super + k" = "bspc node -f north";
      "super + l" = "bspc node -f east";

      "super + shift + h" = "bspc node -s west";
      "super + shift + j" = "bspc node -s south";
      "super + shift + k" = "bspc node -s north";
      "super + shift + l" = "bspc node -s east";

      "super + space" = "bspc node -t ~floating";
      "super + f"     = "bspc node -t ~fullscreen";
      "super + q"     = "bspc node -c";

      "super + Escape" = "pkill -USR1 -x sxhkd";
    };
  };

  home.packages = with pkgs; [ 
    sl neovim
    tmux

    bat
    eza
    xclip

    self.packages.${pkgs.system}.scripts
  ];

  home.stateVersion = "25.05";
}

