{ config, pkgs, self, ... }:
{
  home.username = "gaaj";
  home.homeDirectory = "/home/gaaj";

  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.zsh.enable = true;

  xsession.enable = true;

xsession.windowManager.bspwm = {
    enable = true;
    # Minimal bspwmrc managed by HM
    rules = { };
    settings = {
      border_width = 2;
      window_gap = 8;
      focus_follows_pointer = true;
    };
    monitors = { }; # leave empty for auto; or define if you want per-monitor desktops
    extraConfig = ''
      # example: set desktops per monitor (uncomment & adjust)
      # bspc monitor -d I II III IV V VI VII VIII IX X
    '';
  };

  programs.sxhkd = {
    enable = true;
    keybindings = {
      # launch terminal / dmenu
      "super + Return" = "alacritty";
      "super + d"      = "dmenu_run";

      # focus/move
      "super + h" = "bspc node -f west";
      "super + j" = "bspc node -f south";
      "super + k" = "bspc node -f north";
      "super + l" = "bspc node -f east";

      "super + shift + h" = "bspc node -s west";
      "super + shift + j" = "bspc node -s south";
      "super + shift + k" = "bspc node -s north";
      "super + shift + l" = "bspc node -s east";

      # layout
      "super + space" = "bspc node -t ~floating";
      "super + f"     = "bspc node -t ~fullscreen";
      "super + q"     = "bspc node -c";

      # reload sxhkd
      "super + Escape" = "pkill -USR1 -x sxhkd";
    };
  };

  home.packages = with pkgs; [ 
    sl neovim tmux eza bat
    self.packages.${pkgs.system}.scripts
  ];

  home.stateVersion = "25.05";
}

