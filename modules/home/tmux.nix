{ pkgs, lib, theme, ... }:
{
  programs.tmux = {
    enable = true;

    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "a";
    baseIndex = 1;
    escapeTime = 0;
    secureSocket = false;
    mouse = true;
    keyMode = "vi";
    historyLimit = 50000;

    plugins = [
      {
        plugin = pkgs.tmuxPlugins.minimal-tmux-status;
        extraConfig = ''
          set -g @minimal-tmux-bg "${theme.accent}"
        '';
      }
    ];

    extraConfig = ''
      unbind h
      unbind j
      unbind k
      unbind l
      bind-key C-h "select-pane -L"
      
      
      
      
      
      
      
      
      
      
      
    '';
  };
}
