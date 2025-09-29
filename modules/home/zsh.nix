{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "";
      plugins = [ "git" ];
    };

    syntaxHighlighting.enable = true;

    shellAliases = {
      l = "eza --icons -l --total-size --no-permissions --no-user --no-time";
      ll = "eza --icons -l --total-size";
      la = "eza --icons -la --total-size --no-permissions --no-user --no-time";
      lla = "eza --icons -la --total-size";
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

      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ${../../dotfiles/p10k.zsh}
    '';

    loginExtra = ''
      # Auto attach tmux on SSH logins with a TTY
      if [[ -n $SSH_CONNECTION && -t 1 && -z $TMUX ]] && command -v tmux >/dev/null; then
        session="ssh-$(hostname -s)"
        exec tmux new-session -A -s "$session"
      fi
    '';
  };
}
