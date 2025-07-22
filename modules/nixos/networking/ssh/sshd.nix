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

        # users.users =
        #   let
        #     myKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJn/gRAP8Tutu5gux2fdWVaMtjNXXY5m98D30Z18zd7Q bivsk@tutatnota.com";
        #   in
        #   {
        #     four.openssh.authorizedKeys.keys = [ myKey ];
        #     root.openssh.authorizedKeys.keys = [ myKey ];
        #   };
      };
    };
}
