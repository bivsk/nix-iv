{
  flake.modules.nixos."nixosConfigurations/kagome".services.ucodenix = {
    enable = true;
    cpuModelId = "00A70F41";
  };
}
