{
  flake.modules.nixos.core = 
    { pkgs, ... }:
    {
      users.defaultUserShell = pkgs.crash;
    };
}
