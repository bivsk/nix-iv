{
  flake.modules.nixos.users = {
    users = {
      mutableUsers = false;

      users = {
        root = {
          isSystemUser = true;
          hashedPassword = "$6$mgch9O.t370AlCqu$fylfs6GueJ7TqP32GQKHm2PROX..wtNY4WBsowRvaOFX2vtBXXWmrPmkOSO7nHXxAZ1qESVbYFFljlLN3N8wt/";
        };

        four = {
          isNormalUser = true;
          extraGroups = [ "wheel" ];
          hashedPassword = "$6$mgch9O.t370AlCqu$fylfs6GueJ7TqP32GQKHm2PROX..wtNY4WBsowRvaOFX2vtBXXWmrPmkOSO7nHXxAZ1qESVbYFFljlLN3N8wt/";
        };
      };
    };
  };
}
