{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = { LC_TIME = "en_GB.UTF-8"; };

  environment.systemPackages = with pkgs; [ vim git htop btop fastfetch ];

  nix.settings.auto-optimise-store = true;
  nix.gc = { automatic = true; dates = "weekly"; options = "--delete-older-than 7d"; };

  services.timesyncd.enable = true;
  security.rtkit.enable = true;
}

