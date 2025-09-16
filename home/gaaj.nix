{ config, pkgs, self, ... }:
{
  home.username = "gaaj";
  home.homeDirectory = "/home/gaaj";

  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.zsh.enable = true;

  home.packages = with pkgs; [ 
    sl neovim tmux eza bat
    self.packages.${pkgs.system}.scripts
  ];

  home.stateVersion = "25.05";
}

