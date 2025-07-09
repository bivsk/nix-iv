let
  port = 2222;
in
{
  flake.modules.nixos.pc = {
    programs.mosh = {
      enable = true;
      openFirewall = true;
    };
    services.openssh = {
      enable = true;
      ports = [ port ];
      settings = {
	# TODO: lockdown
        KbdInteractiveAuthentication = true;
        PasswordAuthentication = true;

        AcceptEnv = "COLORTERM";
      };
    };
  };
}
