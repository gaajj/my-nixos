{ pkgs, lib, ... }:
{
  programs.tmux = {
    enable = true;

    shell = "${pkgs.zsh}/bin/zsh";
    shortcut = "a";
    baseIndex = 1;
    renumberWindows = true;
    escapeTime = 0;
    secureSocket = 0;
    mouse = true;
    keyMode = "vi";
    historyLimit = 50000;

    plugins = with pkgs.tmuxPlugins; [
      tpm
      #sensible
      #resurrect
      #continuum
    ];

    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
      
      bind | split-window -h -c "#{pane_current_path]"
      bind ~ split-window -v -c "#{pane_current_path]"
      
      set -g status-bg default
      set -g status-fg colour245
      set -g status-left  " #S "
      set -g status-right ""
      set -g pane-border-style fg=colour240
      set -g pane-active-border-style fg=colour10

      set -g @plugin 'tmux-plugins/tpm'
      
      set -g @plugin 'christoomey/vim-tmux-navigator'

      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
}
