{ config, ... }:
{
  networking.hostName = "bart";
  networking.networkmanager.enable = true;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 6222 ];
}

