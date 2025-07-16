{
  flake.modules.homeManager.nushell =
    { config, lib, pkgs, ... }:
    let
      inherit (lib)
	getExe
	readFile
	;
    in
    {
      home = {
        sessionVariables.SHELLS = getExe pkgs.nushell;

	shellAliases = {
	  cp = "cp --recursive --verbose --progress";
	  mk = "mkdir";
	  rm = "rm --recursive --verbose";

	  pstree = "pstree -g 2";
	  tree = "eza --tree --git-ignore --group-directories-first";
	  fg = "job unfreeze";
	};

	packages = [ pkgs.zoxide ];
      };

      xdg.configFile = {
        "nushell/zoxide.nu".source = pkgs.runCommand "zoxide.nu" { } ''
          ${getExe pkgs.zoxide} init nushell --cmd cd > $out
        '';

        "nushell/ls_colors.txt".source = pkgs.runCommand "ls_colors.txt" { } ''
          ${getExe pkgs.vivid} generate solarized-dark > $out
        '';

        "nushell/starship.nu".source = pkgs.runCommand "starship.nu" { } ''
          ${getExe pkgs.starship} init nu > $out
	'';
      };

      programs.nushell = {
        enable = true;
	configFile.text = readFile ./config.nu;
	envFile.text = readFile ./environment.nu;

	environmentVariables =
          let
            environmentVariables = config.environment.variables;

            homeVariables = config.home.sessionVariables;
            homeVariablesExtra = { };
          in
          environmentVariables // homeVariables // homeVariablesExtra;
      };
    };
}
