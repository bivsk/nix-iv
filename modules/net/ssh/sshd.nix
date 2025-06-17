{lib, ...}: let
  inherit (lib) enabled;
  port = 2222;
in {
  programs.mosh = enabled {
    openFirewall = true;
  };

  services.openssh = enabled {
    ports = [port];
    settings = {
      # TODO: lock down
      KbdInteractiveAuthentication = true;
      PasswordAuthentication = true;

      AcceptEnv = "SHELLS COLORTERM";
    };
  };
}
