{
  flake.modules.nixos.users = {
    users = {
      mutableUsers = false;

      users = {
        root = {
          isSystemUser = true;
        };

        four = {
          isNormalUser = true;
          extraGroups = [
            # Enable ‘sudo’ for the user.
            "wheel"

            # Enable user to add and edit network connections
            # TODO: move to network-manager
            "networkmanager"
          ];

          hashedPassword = "$6$mgch9O.t370AlCqu$fylfs6GueJ7TqP32GQKHm2PROX..wtNY4WBsowRvaOFX2vtBXXWmrPmkOSO7nHXxAZ1qESVbYFFljlLN3N8wt/";
        };
      };
    };
  };
}
