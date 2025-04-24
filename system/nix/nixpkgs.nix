{self, ...}: {
  nixpkgs = {
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
    ];

    # overlays = [
    #   (final: prev: {
    #     lib =
    #       prev.lib
    #       // {
    #         colors = import "${self}/lib/colors" prev.lib;
    #       };
    #   })
    # ];
  };
}
