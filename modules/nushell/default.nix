{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    attrValues
    enabled
    filter
    first
    foldl'
    getExe
    last
    match
    mkIf
    nameValuePair
    optionalAttrs
    readFile
    removeAttrs
    splitString
    ;
in
{
  environment = {
    sessionVariables.SHELLS = getExe pkgs.nushell;

    shellAliases = {
      la = "ls --all";
      lla = "ls --long --all";
      sl = "ls";

      cp = "cp --recursive --verbose --progress";
      mk = "mkdir";
      mv = "mv --verbose";
      rm = "rm --recursive --verbose";

      pstree = "pstree -g 2";
      tree = "eza --tree --git-ignore --group-directories-first";
      fg = "job unfreeze";
    };

    systemPackages = attrValues {
      inherit (pkgs)
        fish # For completions.
        zoxide # For completions and better cd.
        ;
    };

    variables.STARSHIP_LOG = "error";
  };

  home-manager.sharedModules = [
    (
      homeArgs:
      let
        homeConfig = homeArgs.config;
      in
      {
        xdg.configFile = {
          "nushell/zoxide.nu".source = pkgs.runCommand "zoxide.nu" { } ''
            ${getExe pkgs.zoxide} init nushell --cmd cd > $out
          '';

          "nushell/ls_colors.txt".source = pkgs.runCommand "ls_colors.txt" { } ''
            ${getExe pkgs.vivid} generate gruvbox-dark-hard > $out
          '';

          "nushell/starship.nu".source = pkgs.runCommand "starship.nu" { } ''
            ${getExe pkgs.starship} init nu > $out
          '';
        };

        programs.starship = enabled {
          enableNushellIntegration = false;

          settings = {
            vcs.disabled = false;

            command_timeout = 100;
            scan_timeout = 20;

            cmd_duration.show_notifications = config.isDesktop;

            package.disabled = config.isServer;

            character.error_symbol = "";
            character.success_symbol = "";
          };
        };

        programs.nushell = enabled {
          configFile.text = readFile ./config.nu;
          envFile.text = readFile ./environment.nu;

          environmentVariables =
            let
              environmentVariables = config.environment.variables;

              homeVariables = homeConfig.home.sessionVariables;
              homeVariablesExtra = { };
            in
            environmentVariables // homeVariables // homeVariablesExtra;

          shellAliases =
            removeAttrs config.environment.shellAliases [
              "ls"
              "l"
            ]
            // {
              cdtmp = "cd (mktemp --directory)";
              ll = "ls --long";
            };
        };
      }
    )
  ];
}
