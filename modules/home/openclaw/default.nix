{
  flake.modules.nixos.openclaw =
    {
      config,
      inputs,
      pkgs,
      ...
    }:
    let
      inherit (config.home-manager.users.four) xdg;
    in
    {
      # need overlay since module references pkgs.openclaw
      nixpkgs.overlays = [ inputs.nix-openclaw.overlays.default ];

      secrets.telegram-bot-token-openclaw = {
        rekeyFile = ./telegramToken.age;
        mode = "400";
        owner = "four";
        group = "users";
      };

      secrets.openclawEnv = {
        rekeyFile = ./openclawEnv.age;
        mode = "400";
        owner = "four";
        group = "users";
      };

      home-manager.sharedModules = [
        {
          imports = [
            inputs.nix-openclaw.homeManagerModules.openclaw
          ];

          # clobber existing file on rebuilds
          home.file.".local/share/openclaw/openclaw.json" = {
            force = true;
          };

          programs.openclaw = {
            documents = ./documents;
            excludeTools = [
              "git"
              "jq"
              "ripgrep"
            ];

            instances.default = {
              enable = true;
              config = {
                gateway = {
                  mode = "local";
                };

                channels.telegram = {
                  tokenFile = config.secrets.telegram-bot-token-openclaw.path;
                  allowFrom = [ 311144953 ];
                  groups = {
                    "*" = {
                      requireMention = true;
                    };
                  };
                };
              };
              package = pkgs.openclaw;
              stateDir = "${xdg.dataHome}/openclaw";
              workspaceDir = "${xdg.dataHome}/openclaw/workspace";

              # Plugins (prod: pinned GitHub). Built-ins are via nix-steipete-tools.
              # MVP target: repo pointers resolve to tools + skills automatically.
              plugins = [
                # { source = "github:joshp123/xuezh"; }
              ];
            };
          };

          # provide secrets to systemd service
          systemd.user.services.openclaw-gateway.Service.EnvironmentFile = config.secrets.openclawEnv.path;
        }
      ];
    };
}
