{ config, ... }:
{
  flake.modules.homeManager.office.imports = with config.flake.modules.homeManager; [
    libreoffice
    tradingview
  ];
}
