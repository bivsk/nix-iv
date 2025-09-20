{
  flake.modules.homeManager.code =
    { pkgs, ... }:
    let
      pythonPkg = pkgs.python314;
    in
    {
      home.sessionVariables = {
        UV_PYTHON_PREFERENCE = "system";
        UV_PYTHON = pythonPkg;
      };

      home.packages = [
        pythonPkg
        pkgs.uv
      ];
    };
}
