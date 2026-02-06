{
  flake.modules.nixos.p2poolix =
    {
      inputs,
      lib,
      pkgs,
      ...
    }:
    {
      imports = [
        inputs.p2poolix.nixosModules.default
      ];

      environment.systemPackages = [
        # tari suite
        inputs.p2poolix.packages.${pkgs.system}.tari
      ];
    };
}
