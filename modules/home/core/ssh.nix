{ config, ... }:
{
  flake.modules.homeManager.core =
    { lib, pkgs, ... }:
    let
      inherit (lib)
        attrNames
        filterAttrs
        head
        mapAttrs
        remove
        ;

      controlDir = "~/.ssh/control";

      hosts =
        config.flake.nixosConfigurations
        |> filterAttrs (_: value: value.config.services.openssh.enable)
        |> mapAttrs (
          _: value: {
            user =
              value.config.users.users
              |> filterAttrs (_: value: value.isNormalUser)
              |> attrNames
              |> remove "root"
              |> head;

            hostname = value.config.networking.ipv4.address;

            port = head value.config.services.openssh.ports;
          }
        );
    in
    {
      home.activation.createControlPath = {
        after = [ "writeBoundary" ];
        before = [ ];
        data = "mkdir --parents ${controlDir}";
      };

      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        matchBlocks = hosts // {
          "*" = {
            setEnv.COLORTERM = "truecolor";
            setEnv.TERM = "xterm-256color";
            controlMaster = "auto";
            controlPath = "${controlDir}/%r@%n:%p";
            controlPersist = "60m";
            serverAliveCountMax = 2;
            serverAliveInterval = 60;
          };
        };
      };
    };
}
