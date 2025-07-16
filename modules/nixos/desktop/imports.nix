{ config, ... }:
{
  flake.modules.nixos.desktop.imports = with config.flake.modules.nixos; [
    android
    auto-login
    bluetooth
    crypto
    display-manager
    gaming
    keyring
    plymouth
    power-management
    printing
    sound
    yubikey
  ];
}
