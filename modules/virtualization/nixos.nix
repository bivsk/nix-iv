{
  flake.modules.nixos.pc.virtualisation.vmVariant = {
    # only added when building VM with build-vm
    virtualisation = {
      memorySize = 8192;
      cores = 8;
    };
  };
}
