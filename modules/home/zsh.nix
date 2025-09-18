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
    };

    initExtra = ''
      # history search with arrows
      bindkey "^[[A" history-search-backward
      bindkey "^[[B" history-search-forward

      # keep non-interactive sessions quiet
      [[ $- != *i* ]] && return
    '';
  };
}
