{
  flake.modules.nixos.virtualization = {
    virtualisation.vmVariant = {
      # for use with `nixos-rebuild build-vm`
      virtualisation = {
        memorySize = 8192;
        cores = 8;
      };
    };
  };
}
