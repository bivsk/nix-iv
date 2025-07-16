{
  flake.modules.nixos.yubikey = {
    services.pcscd.enable = true;
  };
}
