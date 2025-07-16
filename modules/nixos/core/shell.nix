{ inputs, ... }:
{
  flake.modules.nixos.core =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [ inputs.crash.overlays.default ];
      users.defaultUserShell = pkgs.crash;
    };
}
