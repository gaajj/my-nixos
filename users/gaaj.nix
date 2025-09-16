{ pkgs, ... }:
{
  users.users.gaaj = {
    isNormalUser = true;
    description = "gaaj";
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILdszCY8+52jxm3wj/OGHVivq0GIMRo8hPbu+3t3M8nK PC ARCH"
    ];
  };

  programs.zsh.enable = true;
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;
}
