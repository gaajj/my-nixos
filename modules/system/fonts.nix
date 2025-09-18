{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      pkgs.nerd-fonts.jetbrains-mono
    ];

    # Optional, but handy so apps auto-pick it
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font Mono" ];
        sansSerif = [ "JetBrainsMono Nerd Font" ];
        serif     = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}
