{
  flake.modules.homeManager.nushell =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      inherit (lib)
        attrValues
        getExe
        readFile
        ;
    in
    {
      home = {
        sessionVariables.SHELLS = getExe pkgs.nushell;

	shell.enableNushellIntegration = true;

        shellAliases = {
	  # TODO: move nushell exclusive aliases out of `home.shellAliases`
          # cp = "cp --recursive --progress --verbose";
          mk = "mkdir --parents";
          rm = "rm --recursive --verbose";

          pstree = "pstree -g 2";
          # fg = "job unfreeze";
        };
        
        # completions
        packages = attrValues { 
          inherit (pkgs)
            inshellisense
            ;
        };
      };

      programs.carapace.enable = true;

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      programs.starship = {
        enable = true;
	#settings = {};
      };

      programs.zoxide = {
        enable = true;
        options = [ "--cmd cd" ];
      };

      programs.nushell = {
        enable = true;
        configFile.text = readFile ./config.nu;
      };
    };
}
