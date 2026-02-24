{
  flake.modules.nixos.nur = 
  { inputs, ... }:
  {
    imports = [
      inputs.nur.modules.nixos.default
    ];
  };
}
