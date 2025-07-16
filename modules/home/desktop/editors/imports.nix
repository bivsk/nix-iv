{ config, ... }:
{
  flake.modules.homeManager.editors.imports = with config.flake.modules.homeManager; [
    racket
    iverilog
    vscode
  ];
}
