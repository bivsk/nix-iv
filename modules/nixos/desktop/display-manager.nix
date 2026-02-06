{
  flake.modules.nixos.display-manager =
    { inputs, pkgs, ... }:
    {
      imports = [ inputs.silentSDDM.nixosModules.default ];

      # services = {
      #   displayManager = {
      #     # autoLogin = {
      #     #   enable = true;
      #     #   user = "four";
      #     # };
      #     sddm = {
      #       enable = true;
      #       wayland.enable = true;
      #       autoNumlock = true;
      #     };
      #   };
      # };

      programs = {
        silentSDDM = {
          enable = true;
          theme = "default";
        };
      };
    };
}
