{ config, ... }:
{
  flake.modules.homeManager.web-browsers.imports = with config.flake.modules.homeManager; [
    brave
    chromium
    firefox
    helium
    qutebrowser
    tor-browser
  ];
}
