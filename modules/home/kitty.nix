{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
      size = 12;
    };

    settings = {
      enable_audio_bell = "no";
      scrollback_lines = 10000;
    };
  };
}
