{
  flake.modules.homeManager.desktop =
    { lib, pkgs, ... }:
    {
      home.packages = [
        pkgs.nil
        pkgs.nixd
      ];
      programs.zed-editor = {
        enable = true;
        extensions = [
          "haskell"
          "nix"
          "rust"
        ];
        userSettings = {
          auto_update = false;
          vim_mode = true;

          lsp = {
            nil = {
              path = lib.getExe pkgs.nil;
            };
            nixd = {
              path = lib.getExe pkgs.nixd;
            };
          };

          context_servers = {
            nixos = {
              command = "nix";
              args = [
                "run"
                "github:utensils/mcp-nixos"
                "--"
              ];
            };
          };
        };
      };
    };
}
