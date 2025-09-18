{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = false;

      character = {
        success_symbol = "[➜](bold green) ";
        error_symbol   = "[✗](bold red) ";
      };

      directory.truncation_length = 3;

      # git
      git_branch.symbol = " ";
      git_state = { disabled = false; };
      git_status = {
        conflicted = "⚔️ ";
        ahead = "⇡";
        behind = "⇣";
        staged = "+";
        modified = "~";
        renamed = "»";
        deleted = "✖";
        untracked = "?";
      };

      # time = { disabled = false; format = "[ $time]($style) "; };
    };
  };
}

