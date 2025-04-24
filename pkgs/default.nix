{
  systems = [" x86_64-linux "];

  perSystem = { pkgs, ... }: {
    packages = {
      tari-universe = pkgs.callPackage ./tari-universe {};
    };
  };
}
