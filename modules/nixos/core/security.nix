{
  flake.modules.nixos.security =
    { pkgs, ... }:
    {
      security = {
        doas = {
          enable = true;
          extraRules = [
            {
              groups = [ "wheel" ];
              keepEnv = true;
              persist = true;
            }
          ];
        };
      };
    };
}
