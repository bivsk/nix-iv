{ inputs, lib, ... }:
let
  inherit (lib) attrValues;

  flake.modules.homeManager.four.imports = [
    anywhere
    linux
  ];

  linux =
    { lib, pkgs, ... }:
    lib.mkIf (pkgs.stdenvNoCC.isLinux) {
      home.packages = with pkgs; [
        gparted
        wl-clipboard
        multimarkdown
      ];
    };

  anywhere =
    { pkgs, attrValues, ... }:
    {
      programs.nh.enable = true;
      programs.home-manager.enable = true;

      home.packages = attrValues 
      <| 
        {
	  inherit (pkgs)
            tree
            fzf
            ripgrep # grep
            bat # cat
            bottom
            htop
            eza # ls
            fd # find
            lazygit # no magit
            tig # alucard
            cachix
            jq
            home-manager
            helix
	  ;
      };
    };

in
{
  inherit flake;
}
