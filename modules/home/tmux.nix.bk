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
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      set -g set-clipboard on
      set -g allow-passthrough on
      set -as terminal-features 'xterm*:clipboard'
      
      bind | split-window -h -c "#{pane_current_path}"
      bind '~' split-window -v -c "#{pane_current_path}"

      bind -T copy-mode-vi "v" send -X begin-selection
      bind -T copy-mode-vi "y" send -X copy-selection

      bind b set -g status
      bind e show-environment -g
      
      # --- Manual vim-tmux-navigator ---
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '(^|/)(g?(view|n?vim?x?))(diff)?$'"

      bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
      bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
      bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
      bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
      bind -n C-\\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"

      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5
    '';
  };
}
