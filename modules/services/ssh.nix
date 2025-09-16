{ ... }:
{
  services.openssh = {
    enable = true;
    openFirewall = true;
    ports = [ 6222 ];

    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      PubkeyAuthentication = true;
      PermitRootLogin = "yes";
      UsePAM = true;

      X11Forwarding = true;
      X11UseLocalhost = true;
      X11DisplayOffset = 10;

      LogLevel = "VERBOSE";
    };
  };
}
