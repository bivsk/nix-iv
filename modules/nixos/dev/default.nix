topLevel: {
  flake.modules.nixos.dev =
    { config, ... }:
    {
      imports = with topLevel.config.flake.modules.nixos; [
        home-manager
        substituters
      ];
    };
}
