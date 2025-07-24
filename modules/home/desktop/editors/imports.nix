{ config, ... }:
{
  flake.modules.homeManager.editors.imports = with config.flake.modules.homeManager; [
    emacs
    racket
    iverilog
    vscode
  ];
}
