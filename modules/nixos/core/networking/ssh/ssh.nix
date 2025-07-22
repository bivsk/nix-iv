{
  flake.modules.nixos.core =
    { lib, ... }:
    {
      programs.ssh.startAgent = true;

      # load secrets that are only readable by four
      secrets = lib.listToAttrs (
        map
          (
            keyName:
            lib.nameValuePair "ssh-${keyName}" {
              rekeyFile = ./keys/${keyName}.age;
              owner = "four";
              mode = "600";
            }
          )
          [
            "github"
          ]
      );
    };
}
