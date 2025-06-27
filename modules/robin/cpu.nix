{
  flake.modules.nixos."nixosConfigurations/robin".services.ucodenix = {
    enable = true;
    cpuModelId = "00830F10";
  };
}
