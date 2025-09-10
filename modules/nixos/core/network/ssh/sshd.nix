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

        # TODO: make sure impermanence is enabled
        hostKeys = [
          {
            path = "/persist/etc/ssh/ssh_host_ed25519_key";
            type = "ed25519";
          }
          {
            path = "/persist/etc/ssh/ssh_host_rsa_key";
            type = "rsa";
            bits = 4096;
          }
        ];

        settings = {
          # TODO: lockdown
          KbdInteractiveAuthentication = true;
          PasswordAuthentication = true;

          AcceptEnv = "SHELLS COLORTERM";
        };
      };

      # TODO: pull in keys per host
      users.users =
        let
          myKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJn/gRAP8Tutu5gux2fdWVaMtjNXXY5m98D30Z18zd7Q bivsk@tutatnota.com";
        in
        {
          four.openssh.authorizedKeys.keys = [ myKey ];
          root.openssh.authorizedKeys.keys = [ myKey ];
        };
    };
}
