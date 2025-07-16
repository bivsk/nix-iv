{ config, ... }:
{
  flake.modules.homeManager.web-browsers.imports = with config.flake.modules.homeManager; [
    chromium
    firefox
    qutebrowser
    tor-browser
  ];
}
