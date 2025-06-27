{
  flake.modules = {
    nixos.pc = {
      networking = {
        networkmanager.enable = true;
        wireless.iwd = {
          enable = true;
          settings = {
            IPv6.Enabled = false;
            Settings.AutoConnect = true;
          };
        };
        networkmanager.wifi.backend = "iwd";
      };
    };

    homeManager.base =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.impala ];
      };
  };
}
