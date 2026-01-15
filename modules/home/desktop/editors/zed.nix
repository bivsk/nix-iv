{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.nixd
        pkgs.nil
      ];
      programs.zed-editor = {
        enable = true;
        extensions = [
          "haskell"
          "nix"
          "rust"
        ];
        extraPackages = [
          pkgs.nixd
          pkgs.nil
        ];
        userSettings = {
          hour_format = "hour24";
          auto_update = false;
          vim_mode = true;

          lsp = {
            nix = {
              binary.path_lookup = true;
            };
          };
        };
      };
    };
}
