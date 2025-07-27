{
  flake.modules.nixos.sound =
    { pkgs, ... }:
    {
      services.pipewire = {
        enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        pulse.enable = true;
      };
      security.rtkit.enable = true;

      home-manager.sharedModules = [
        {
          home.packages = [
            pkgs.pwvucontrol
            pkgs.qpwgraph
            pkgs.wiremix
          ];
        }
      ];
    };
}
