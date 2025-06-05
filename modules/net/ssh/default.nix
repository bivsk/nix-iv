{ self, config, lib, pkgs, ... }: let
  inherit (lib) attrNames enabled filterAttrs head mapAttrs mkIf remove;

  controlDir = "~/.ssh/control";

  hosts = self.nixosConfigurations
    |> filterAttrs (_: value: value.config.services.openssh.enable)
    |> mapAttrs (_: value: {
      user = value.config.users.users
        |> filterAttrs (_: value: value.isNormalUser)
        |> attrNames
        |> remove "root"
        |> head;
  
      hostname = value.config.networking.ipv4.address;

      port = head value.config.services.openssh.ports;
    });
in {
  secrets.sshConfig = {
    file = ./config.age;
    mode = "444";
  };

  home-manager.sharedModules = [{
    home.activation.createControlPath = {
      after = [ "writeBoundary" ];
      before = [];
      data = "mkdir --parents ${controlDir}";
    };

    programs.ssh = enabled {
      controlMaster = "auto";
      controlPath = "${controlDir}/%r@%n:%p";
      controlPersist = "60m";
      serverAliveCountMax = 2;
      serverAliveInterval = 60;

      includes = [ config.secrets.sshConfig.path ];

      matchBlocks = hosts // {
        "*" = {
	  setEnv.COLORTERM = "truecolor";
	  setEnv.TERM = "xterm-256color";

	  identityFile = "~/.ssh/id";
	};
      };
    };
  }];
}
