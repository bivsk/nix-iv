{
  flake.modules.nixos.desktop = {
    programs = {
      dconf.enable = true;
    };

    services = {
      gnome = {

        # programs.ssh.startAgent is already providing an SSH agent
        gcr-ssh-agent.enable = false;
      };
      udisks2.enable = true;
    };
  };
}
