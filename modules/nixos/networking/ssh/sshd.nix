{
  flake.modules.nixos.sshd = 
  let
    port = 2222;
  in
  {
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

	AcceptEnv = "SHELLS COLORTERM";
      };
    };

    # users.users =
    #   let
    #     persoKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEJSonNBBb1DlhaO4EfMh3TbIIsV25phZQ9vp/qKOw9E";
    #   in
    #   {
    #     four.openssh.authorizedKeys.keys = [ persoKey ];
    #     root.openssh.authorizedKeys.keys = [ persoKey ];
    #   };
  };
}
