{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "eza -l --icons";
      la = "eza -la --icons";
      cat = "bat";
      v  = "nvim";
      gs = "git status -sb";

      pbcopy = "xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -o";
    };

    initExtra = ''
      # history search with arrows
      bindkey "^[[A" history-search-backward
      bindkey "^[[B" history-search-forward

      # keep non-interactive sessions quiet
      [[ $- != *i* ]] && return
    '';

    loginExtra = ''
      # Auto attach tmux on SSH logins with a TTY
      if [[ -n $SSH_CONNECTION && -t 1 -- -z $TMUX ]] && command -v tmux >/dev/null; then
        session="ssh-$(hostname -s)"
        exec tmux new-session -A -s "$session"
      fi
    '';
  };
}
