{
  flake.modules.homeManager.iverilog = 
    { pkgs, ... }:
    {
      home.packages = [ pkgs.iverilog ];
    };
}
