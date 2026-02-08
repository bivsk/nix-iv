{
  flake.modules.nixos.display-manager =
    { inputs, pkgs, ... }:
    {
      imports = [ inputs.silentSDDM.nixosModules.default ];

      programs = {
        silentSDDM = {
          enable = true;
          theme = "rei";
        };
      };
    };
}
