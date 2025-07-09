{
  flake.modules.homeManager.base = 
    { lib, pkgs, ... }:
    {
      home.packages = lib.attrValues {
        inherit (pkgs)
	  python3
	  uv
	  ;
      };
    };
}
